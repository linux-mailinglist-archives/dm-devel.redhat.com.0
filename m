Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AEEE91026FD
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 15:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574174469;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=R6Y1XpwPChLg/ubGpXqRxoVo+v8bO+xdEASbDizOwRU=;
	b=ST+2eja1jpvoPSd4sKLGaFtXLRPXD6lqieTUfbSf/h/aKb/MGZaM8v4S8VqNZIqHPv/2fB
	DM1YlEDaN0cHwwwutVSWoiwp8GDqBYeba5lYNicG6v/RDiqJ5AEyTYWxzYgYqbADu26Tni
	6t1YvQYnK9U42L4Wa0R/8f+iRb3/k0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-nLMT6fiiPBGERxvW0h2mfA-1; Tue, 19 Nov 2019 09:41:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E59961802D08;
	Tue, 19 Nov 2019 14:41:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E8346E76;
	Tue, 19 Nov 2019 14:41:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE00818089CD;
	Tue, 19 Nov 2019 14:40:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJEes4L027727 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 09:40:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 91DA51746F; Tue, 19 Nov 2019 14:40:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D58A51A8
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:40:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19955800147
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:40:52 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-8BsJnkbwO6KhLgGzVVgb4w-1; Tue, 19 Nov 2019 09:40:50 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so3318854lfp.2
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 06:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8U4ilfUNpUqe6+CIAyFMlutnwFO+5K2+9W49ylkKQMM=;
	b=qLJY0F0cv6efNrrf48rCYezBxll+7zapVx19deJWGkB2lPuTQghLQEgcipxEAmzgWH
	KR75C/GVRBuYFu0jmX2PK/DcARYQCDuaL5UNhzoQMqeSn0kXhzKeP3aTjhLTg+Lr9c9d
	HBIoZklZjY2iaJS8pg4VmE1dt0WR8CWUm1OoBtOR9GJNsunJZBP4j9YriX1y2X7A+kyl
	0p/9mALWKHebQcFXGVCkkiZQGW/ooHTTZxTlYVZCCmX+BB8kTKVLewk06CAwN02lBIh7
	wnNGtudLAUxajYcbjZtJPlzh5XoqpeDd/rSkIqWUBKiR3kIayCy99TtBu2rtOXVoEGtl
	xAOQ==
X-Gm-Message-State: APjAAAWWqs848g4opv5RaakC9pT+iaqrKgvFYvolXeVKSP9ES2A9znjb
	0xKt8YGAqHCmaMv35WZ22TuTjR5Z2as=
X-Google-Smtp-Source: APXvYqwQ5Cw0jdczcc3tUcvvfb0NoGvNO69Vq4gv9H673lNnWrFQtrDBkR/5U8LVszUeD0XDomblZQ==
X-Received: by 2002:a19:6a16:: with SMTP id u22mr4178121lfu.94.1574174447938; 
	Tue, 19 Nov 2019 06:40:47 -0800 (PST)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	r19sm10464261lfi.13.2019.11.19.06.40.47 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2019 06:40:47 -0800 (PST)
Resent-From: Nikos Tsironis <ntsironis@arrikto.com>
Resent-To: dm-devel@redhat.com
Resent-Date: Tue, 19 Nov 2019 16:40:46 +0200
Resent-Message-ID: <2943df9c-0bec-e419-2e74-b4a2282e7c0f@arrikto.com>
To: Mikulas Patocka <mpatocka@redhat.com>, tglx@linutronix.de,
	linux-rt-users@vger.kernel.org
References: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <335dafcb-5e07-63ed-b288-196516170bde@arrikto.com>
Date: Wed, 13 Nov 2019 12:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-MC-Unique: 8BsJnkbwO6KhLgGzVVgb4w-1
X-MC-Unique: nLMT6fiiPBGERxvW0h2mfA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Daniel Wagner <dwagner@suse.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Scott Wood <swood@redhat.com>
Subject: Re: [dm-devel] [PATCH RT 2/2 v2] list_bl: avoid BUG when the list
	is not locked
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/12/19 6:16 PM, Mikulas Patocka wrote:
> list_bl would crash with BUG() if we used it without locking. dm-snapshot 
> uses its own locking on realtime kernels (it can't use list_bl because 
> list_bl uses raw spinlock and dm-snapshot takes other non-raw spinlocks 
> while holding bl_lock).
> 
> To avoid this BUG, we must set LIST_BL_LOCKMASK = 0.
> 
> This patch is intended only for the realtime kernel patchset, not for the 
> upstream kernel.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> Index: linux-rt-devel/include/linux/list_bl.h
> ===================================================================
> --- linux-rt-devel.orig/include/linux/list_bl.h	2019-11-07 14:01:51.000000000 +0100
> +++ linux-rt-devel/include/linux/list_bl.h	2019-11-08 10:12:49.000000000 +0100
> @@ -19,7 +19,7 @@
>   * some fast and compact auxiliary data.
>   */
>  
> -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
> +#if (defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)) && !defined(CONFIG_PREEMPT_RT_BASE)
>  #define LIST_BL_LOCKMASK	1UL
>  #else
>  #define LIST_BL_LOCKMASK	0UL
> @@ -161,9 +161,6 @@ static inline void hlist_bl_lock(struct
>  	bit_spin_lock(0, (unsigned long *)b);
>  #else
>  	raw_spin_lock(&b->lock);
> -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
> -	__set_bit(0, (unsigned long *)b);
> -#endif
>  #endif
>  }
>  

Hi Mikulas,

I think removing __set_bit()/__clear_bit() breaks hlist_bl_is_locked(),
which is used by the RCU variant of list_bl.

Nikos

> @@ -172,9 +169,6 @@ static inline void hlist_bl_unlock(struc
>  #ifndef CONFIG_PREEMPT_RT_BASE
>  	__bit_spin_unlock(0, (unsigned long *)b);
>  #else
> -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
> -	__clear_bit(0, (unsigned long *)b);
> -#endif
>  	raw_spin_unlock(&b->lock);
>  #endif
>  }
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

