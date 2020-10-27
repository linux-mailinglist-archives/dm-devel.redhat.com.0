Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B94DA29AD20
	for <lists+dm-devel@lfdr.de>; Tue, 27 Oct 2020 14:21:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-KUS_EjyyPt6IzX6M12DVzA-1; Tue, 27 Oct 2020 09:21:15 -0400
X-MC-Unique: KUS_EjyyPt6IzX6M12DVzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 629E4807105;
	Tue, 27 Oct 2020 13:21:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D1D910013C0;
	Tue, 27 Oct 2020 13:21:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18F4ECF47;
	Tue, 27 Oct 2020 13:21:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09RD5NuP022876 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Oct 2020 09:05:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AF16110C596; Tue, 27 Oct 2020 13:05:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25AB6110C592
	for <dm-devel@redhat.com>; Tue, 27 Oct 2020 13:05:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1F9C8582BA
	for <dm-devel@redhat.com>; Tue, 27 Oct 2020 13:05:18 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-492-_rgpn20zPp-LKceaxBSYJA-1; Tue, 27 Oct 2020 09:05:13 -0400
X-MC-Unique: _rgpn20zPp-LKceaxBSYJA-1
Received: by mail-wm1-f65.google.com with SMTP id v5so1316823wmh.1;
	Tue, 27 Oct 2020 06:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=myy/l02Rm8F+X0fdWIlyuf1JwB3VU/GU2tmaR4vsSCk=;
	b=ZntcqqrzdWQqpffOChbWUlBa1K4BcEkYH4GWE5ZUcmCd13A6bql3MmEgM+kRLP24OO
	UEaNv0ZYAv02489anz+OOQimC/gDJFovwJ0Wg25dW7lCMDg+b5n4J0akLgqIZdZIS9kH
	5J87pqFU3ZRcS5nKvEix58g8bKdIs8J7f1+OudcQJLlSuDqeK3rayiVqZ8kD1jX8+b2R
	D+9RvosCwOpcxEvkHwde73ndPZXgMJJgc8L0bEcfmUjLKVVeWb3X3GQ5WcYVJ+m/9OXt
	I25Sqkpzomx2U4WxNv8nqTw8qIt+hhckxX/fusW80QQNdDD6NT0tdmUMw9bXaajP+oiZ
	76VQ==
X-Gm-Message-State: AOAM530sOLsx+Pwlr2gRNozLwKVfi1kPtNFJ8IOhJX3OjbVefpLI69J6
	H+uDtv1OGMoIMpOEq31eGIc=
X-Google-Smtp-Source: ABdhPJw2WkckDLSI9JGvq3GUMLI8ZV6nTEuB/GOGNsDV91M7d1D0A1mFL4txXw9pl279LalTttu+tQ==
X-Received: by 2002:a1c:6643:: with SMTP id a64mr2744990wmc.142.1603803911919; 
	Tue, 27 Oct 2020 06:05:11 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id o3sm1971923wru.15.2020.10.27.06.05.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 27 Oct 2020 06:05:11 -0700 (PDT)
To: Gilad Ben-Yossef <gilad@benyossef.com>
References: <20201026130450.6947-1-gilad@benyossef.com>
	<20201026130450.6947-4-gilad@benyossef.com>
	<20201026175231.GG858@sol.localdomain>
	<d07b062c-1405-4d72-b907-1c4dfa97aecb@gmail.com>
	<20201026183936.GJ858@sol.localdomain>
	<fd5e46ce-a4bf-8025-05ea-e20d35485446@gmail.com>
	<CAOtvUMdatUOnffg90aEGanD0y1LtKc7EeKQ=E+N+W-wpo8Zo3A@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <7c8c1453-94b2-23ec-1c93-7674fc8a413b@gmail.com>
Date: Tue, 27 Oct 2020 14:05:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAOtvUMdatUOnffg90aEGanD0y1LtKc7EeKQ=E+N+W-wpo8Zo3A@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Mike Snitzer <snitzer@redhat.com>,
	Linux kernel mailing list <linux-kernel@vger.kernel.org>,
	Eric Biggers <ebiggers@kernel.org>, Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>, Alasdair Kergon <agk@redhat.com>,
	Ofir Drang <ofir.drang@arm.com>
Subject: Re: [dm-devel] [PATCH 3/4] dm crypt: switch to EBOIV crypto API
	template
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 27/10/2020 07:59, Gilad Ben-Yossef wrote:
> On Mon, Oct 26, 2020 at 9:04 PM Milan Broz <gmazyland@gmail.com> wrote:
...
>> We had all of disk-IV inside dmcrypt before - but once it is partially moved into crypto API
>> (ESSIV, EBOIV for now), it becomes much more complicated for user to select what he needs.
>>
>> I think we have no way to check that IV is available from userspace - it
>> will report the same error as if block cipher is not available, not helping user much
>> with the error.
>>
>> But then I also think we should add abstract dm-crypt options here (Legacy TrueCrypt modes,
>> Bitlocker modes) that will select these crypto API configuration switches.
>> Otherwise it will be only a complicated matrix of crypto API options...
> 
> hm... just thinking out loud, but maybe the right say to go is to not
> have a build dependency,
> but add some user assistance code in cryptosetup that parses
> /proc/crypto after failures to
> try and suggest the user with a way forward?
> 
> e.g. if eboiv mapping initiation fails, scan /proc/crypto and either
> warn of a lack of AES
> or, assuming some instance of AES is found, warn of lack of EBOIV.
> It's a little messy
> and heuristic code for sure, but it lives in a user space utility.
> 
> Does that sound sane?

Such an idea (try to parse /proc/crypto) is on my TODO list since 2009 :)
I expected userspace kernel crypto API could help here, but it seems it is not the case.

So yes, I think we need to add something like this in userspace. In combination with
the kernel and dmcrypt target version, we could have a pretty good hint matrix for the user,
instead of (literally) cryptic errors.

(There is also a problem that device-mapper targets are losing detailed error state.
We often end just with -EINVAL during table create ... and no descriptive log entry.
And leaking info about encrypted devices activation failures to syslog is not a good idea either.)

Anyway, this will not fix existing userspace that is not prepared for this kind
of EBOIV missing fail, so Herbert's solution seems like the solution for this particular
problem for now. (But I agree we should perhaps remove these build dependences in future completely...)

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

