Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6391A1026FC
	for <lists+dm-devel@lfdr.de>; Tue, 19 Nov 2019 15:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574174446;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:resent-to:
	 resent-from:resent-message-id:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YSvLfOe8zfcTBJznt0P2dEVDMC2c6SNqjJrHXeDV9uY=;
	b=YH/D8gYrIOb+/v1SAmp5vuWkEtLGSahX+CXhSOCT8xilNfTPjrs2SQGrZcu5G9AMvpSy51
	/aJR584I6seDMu7glfG3yZYGeM3hOyRevfD+cKnx5xx0/KBE1sIdBDtp1+EycboKCO3X1G
	QddA+6pjwJVgGmnmJtFkPyinfAPb8P8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-aj-qTQL_N2qpOsgPwTtX_A-1; Tue, 19 Nov 2019 09:40:43 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A4528048E8;
	Tue, 19 Nov 2019 14:40:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4B034DA02;
	Tue, 19 Nov 2019 14:40:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A55AD18089C8;
	Tue, 19 Nov 2019 14:40:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAJEeMfj027702 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Nov 2019 09:40:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A54BE2166B09; Tue, 19 Nov 2019 14:40:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13802166B07
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:40:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10A7E1011A60
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 14:40:18 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-61-OHbUXCBjPISLH2l9Zm90vw-1; Tue, 19 Nov 2019 09:40:15 -0500
Received: by mail-lj1-f194.google.com with SMTP id n5so23599231ljc.9
	for <dm-devel@redhat.com>; Tue, 19 Nov 2019 06:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-to:resent-date
	:resent-message-id:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=F3ba3fPaNjj6mlJHz6ZNFQ1Kt4UtZpzpsGyGcMEsfIQ=;
	b=D2ydbKiHpH1Be8Psv1IjJ7LAam7BfIkXo/nKHNhPkMcaVJpH/U2VJDU2DUTS+wrmz9
	x5GLQb6IrAtGKgnFjQO9XBpUN60jp0PVQYoOcH90nu/3SMv3fgCB5iaRuYxd4o/EiVDF
	S2jQsuCcKNFmP9wBl+jdkqzg07SCeGo8YeGB4yYmo3CA0fmpLVoiD2aXsa+zJHSduo+7
	KgQkJSWYTFOmGAW49ibOaGcYHEhphWGTRX+YXkm/zWQDnLRlljypxPbPAWvAhke8Soru
	+NqSd9YJ2/BwPeQpE81GoG0aNUQds//5ND/g/2HXpkLX0hT/0rx59uyNnswPJbnaI69Z
	/lsw==
X-Gm-Message-State: APjAAAVotGsdELZB26BFGE7KxHcFMqNMlxHlw5UqR8b72AizMtlKEkz+
	uDo5lZYZyZCukujsQ44o8l8MKfrSr58=
X-Google-Smtp-Source: APXvYqx35VElmi1xpbPCXfwvxWcbWE7i4RQAOwAw8AUrKZQy0eypV7ehbk4rLMDJcByeFiX0xXkW5w==
X-Received: by 2002:a2e:9610:: with SMTP id v16mr4131314ljh.219.1574174413265; 
	Tue, 19 Nov 2019 06:40:13 -0800 (PST)
Received: from [10.94.250.118] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	q11sm9897949ljm.107.2019.11.19.06.40.12 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2019 06:40:13 -0800 (PST)
Resent-From: Nikos Tsironis <ntsironis@arrikto.com>
Resent-To: dm-devel@redhat.com
Resent-Date: Tue, 19 Nov 2019 16:40:11 +0200
Resent-Message-ID: <84c09957-010c-44d3-53b7-3834dde8d13b@arrikto.com>
To: Mikulas Patocka <mpatocka@redhat.com>
References: <alpine.LRH.2.02.1911121110430.12815@file01.intranet.prod.int.rdu2.redhat.com>
	<335dafcb-5e07-63ed-b288-196516170bde@arrikto.com>
	<alpine.LRH.2.02.1911130616240.20335@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <7020d479-e8c7-7249-c6cd-c6d01b01c92a@arrikto.com>
Date: Wed, 13 Nov 2019 13:50:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1911130616240.20335@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-MC-Unique: OHbUXCBjPISLH2l9Zm90vw-1
X-MC-Unique: aj-qTQL_N2qpOsgPwTtX_A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, linux-rt-users@vger.kernel.org,
	Daniel Wagner <dwagner@suse.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, tglx@linutronix.de,
	Scott Wood <swood@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/13/19 1:16 PM, Mikulas Patocka wrote:
> 
> 
> On Wed, 13 Nov 2019, Nikos Tsironis wrote:
> 
>> On 11/12/19 6:16 PM, Mikulas Patocka wrote:
>>> list_bl would crash with BUG() if we used it without locking. dm-snapshot 
>>> uses its own locking on realtime kernels (it can't use list_bl because 
>>> list_bl uses raw spinlock and dm-snapshot takes other non-raw spinlocks 
>>> while holding bl_lock).
>>>
>>> To avoid this BUG, we must set LIST_BL_LOCKMASK = 0.
>>>
>>> This patch is intended only for the realtime kernel patchset, not for the 
>>> upstream kernel.
>>>
>>> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>>>
>>> Index: linux-rt-devel/include/linux/list_bl.h
>>> ===================================================================
>>> --- linux-rt-devel.orig/include/linux/list_bl.h	2019-11-07 14:01:51.000000000 +0100
>>> +++ linux-rt-devel/include/linux/list_bl.h	2019-11-08 10:12:49.000000000 +0100
>>> @@ -19,7 +19,7 @@
>>>   * some fast and compact auxiliary data.
>>>   */
>>>  
>>> -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
>>> +#if (defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)) && !defined(CONFIG_PREEMPT_RT_BASE)
>>>  #define LIST_BL_LOCKMASK	1UL
>>>  #else
>>>  #define LIST_BL_LOCKMASK	0UL
>>> @@ -161,9 +161,6 @@ static inline void hlist_bl_lock(struct
>>>  	bit_spin_lock(0, (unsigned long *)b);
>>>  #else
>>>  	raw_spin_lock(&b->lock);
>>> -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
>>> -	__set_bit(0, (unsigned long *)b);
>>> -#endif
>>>  #endif
>>>  }
>>>  
>>
>> Hi Mikulas,
>>
>> I think removing __set_bit()/__clear_bit() breaks hlist_bl_is_locked(),
>> which is used by the RCU variant of list_bl.
>>
>> Nikos
> 
> OK. so I can remove this part of the patch.
> 

I think this causes another problem. LIST_BL_LOCKMASK is used in various
functions to set/clear the lock bit, e.g. in hlist_bl_first(). So, if we
lock the list through hlist_bl_lock(), thus setting the lock bit with
__set_bit(), and then call hlist_bl_first() to get the first element,
the returned pointer will be invalid. As LIST_BL_LOCKMASK is zero the
least significant bit of the pointer will be 1.

I think for dm-snapshot to work using its own locking, and without
list_bl complaining, the following is sufficient:

--- a/include/linux/list_bl.h
+++ b/include/linux/list_bl.h
@@ -25,7 +25,7 @@
 #define LIST_BL_LOCKMASK       0UL
 #endif

-#ifdef CONFIG_DEBUG_LIST
+#if defined(CONFIG_DEBUG_LIST) && !defined(CONFIG_PREEMPT_RT_BASE)
 #define LIST_BL_BUG_ON(x) BUG_ON(x)
 #else
 #define LIST_BL_BUG_ON(x)

Nikos

> Mikulas
> 
>>> @@ -172,9 +169,6 @@ static inline void hlist_bl_unlock(struc
>>>  #ifndef CONFIG_PREEMPT_RT_BASE
>>>  	__bit_spin_unlock(0, (unsigned long *)b);
>>>  #else
>>> -#if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
>>> -	__clear_bit(0, (unsigned long *)b);
>>> -#endif
>>>  	raw_spin_unlock(&b->lock);
>>>  #endif
>>>  }
>>>
>>
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

