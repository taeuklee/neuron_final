package com.neuron.spring;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import com.neuron.spring.util.RequestResolver;

public class TwsMapArgumentResolver implements HandlerMethodArgumentResolver{

    public boolean supportsParameter(MethodParameter parameter) {
        return RequestResolver.class.isAssignableFrom(parameter.getParameterType());
    }

    
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
    	RequestResolver requestResolver = new RequestResolver();

        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        Enumeration<?> enumeration = request.getParameterNames();

        String key = null;
        String[] values = null;


        while(enumeration.hasMoreElements()){
            key = (String) enumeration.nextElement();
            values = request.getParameterValues(key);
            if(values != null){
            	requestResolver.put(key, (values.length > 1) ? values:values[0] );
            }
        }

        return requestResolver;
    }
}