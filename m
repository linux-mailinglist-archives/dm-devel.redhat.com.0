Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BF79520C90B
	for <lists+dm-devel@lfdr.de>; Sun, 28 Jun 2020 18:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593363077;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=ddqKIh+i0XEbRBz0udGVVb50FOaszUEJFA30qyYvJQ8=;
	b=GrLuRe9PigGh9RjvOZ5bkv5jVW6er32imPxfg4vnxSWeUTy/WBD4YxK5SNVtoLCBGIokrK
	DA/cB6PVJlmYJqmAu/MTplZk3wEV/uR7d5Iqvcl/F/oB4XczoODsdsEppF6Wxf02rEOVE9
	gNsucrQgcvLH/Dmer9Y6zR9N7r7x988=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-gQ6cxYxWNwGdOnjLqEKGTA-1; Sun, 28 Jun 2020 12:51:15 -0400
X-MC-Unique: gQ6cxYxWNwGdOnjLqEKGTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 130121005512;
	Sun, 28 Jun 2020 16:51:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D38CD1002397;
	Sun, 28 Jun 2020 16:51:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B8E71809547;
	Sun, 28 Jun 2020 16:50:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05SGonMl001439 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jun 2020 12:50:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFCEA8A4DB; Sun, 28 Jun 2020 16:50:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 909A38A4D8
	for <dm-devel@redhat.com>; Sun, 28 Jun 2020 16:50:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F018101A525
	for <dm-devel@redhat.com>; Sun, 28 Jun 2020 16:50:46 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-244--nWhiRsWP0-HD5XGC4VnHA-1; Sun, 28 Jun 2020 12:50:43 -0400
X-MC-Unique: -nWhiRsWP0-HD5XGC4VnHA-1
Received: by mail-pg1-f176.google.com with SMTP id w2so6411264pgg.10
	for <dm-devel@redhat.com>; Sun, 28 Jun 2020 09:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ND4rpQ4Yjo4FAQdwrLPLeNgfb8+1JfelPZDKro4ozkI=;
	b=QiJqQvqdZRSZ2LVjFO1BHIMDfKKFwxczUzJDF2HlbJ56fvysHOJyDai9fDGB11Zusl
	TouUKqgH2g9erw7Gwvx3+wuHU8I+9iixGFf580AnAnveDkg4sdaWMbcKD5fwe/PVsoeb
	w6rrSKPO9S2wiNBULICIMvkYLGT2fRUgjlIuaLno6sFwDUvGRF85zgUChzRljd8g8djk
	2rJx/4JCBRMoeYD93kcqJV2gc8U+oNte+pGJHSkfYiBUOdzS10Fifb9vURRT5g6O7NC/
	oxmvYr9eRFhp8+LSjfZTd9i34796nh3LXg7folZmiu8NBM4UNxpfPuAMY4BBNxxWb24/
	mIqg==
X-Gm-Message-State: AOAM533u8rMc6l3XjDrDOolXe/w+apvx5x5fDlZfDpwDGAqRJPpC5ncV
	AISgajZBkP/ap6dI0e4DpDNObP64
X-Google-Smtp-Source: ABdhPJwdk7Fkivknw1tGbqWA6V34a2qUVoJPhDpchHU2vijRQaqk6ywDqIavkk55gHQu3FtewroeSw==
X-Received: by 2002:a62:ae0d:: with SMTP id q13mr2506473pff.89.1593363042119; 
	Sun, 28 Jun 2020 09:50:42 -0700 (PDT)
Received: from [192.168.50.147] (c-73-241-217-19.hsd1.ca.comcast.net.
	[73.241.217.19]) by smtp.gmail.com with ESMTPSA id
	bx23sm11368959pjb.47.2020.06.28.09.50.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 28 Jun 2020 09:50:41 -0700 (PDT)
To: Artur Paszkiewicz <artur.paszkiewicz@intel.com>, dm-devel@redhat.com
References: <fb4877be-4d88-2816-9000-dcc540e8c093@intel.com>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
	mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
	LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
	fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
	AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
	3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
	AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
	igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
	Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
	jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
	macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
	CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
	RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
	PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
	eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
	lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
	T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
	++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
	CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
	oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
	//x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
	mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
	goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <f4e57ef4-e0df-d2e6-a00a-074a08f10dbb@acm.org>
Date: Sun, 28 Jun 2020 09:50:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <fb4877be-4d88-2816-9000-dcc540e8c093@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-crypt hard lockup
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-06-26 02:07, Artur Paszkiewicz wrote:
> I'm getting regular lockups which seem to be caused by dm-crypt. I
> reproduced it on vanilla v5.8-rc2, but I started regularly seeing this
> some time ago on openSUSE Tumbleweed kernels. It's easily reproducible
> (every time, after about a minute) when I run "make -j" on the linux
> kernel sources, sometimes it occurs also when doing other IO intensive
> tasks on multiple CPUs. I'm using LVM and ext4 on dm-crypt devices,
> Intel SSDSC2KW010X6 and SSDSC2BA200G3 SSDs.

Since considerable time I'm doing kernel builds (make -j8) on an
openSUSE Tumbleweed system on top of dm-crypt and an NVMe SSD but I have
not yet encountered any kind of lockup. Maybe another driver, e.g. an
I/O scheduler, is responsible for the lockups?

Bart.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

