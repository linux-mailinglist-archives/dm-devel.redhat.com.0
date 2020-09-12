Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE8426795B
	for <lists+dm-devel@lfdr.de>; Sat, 12 Sep 2020 12:06:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-yuSQ02EqMBif-jegTbOWlQ-1; Sat, 12 Sep 2020 06:06:35 -0400
X-MC-Unique: yuSQ02EqMBif-jegTbOWlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ED6D1074649;
	Sat, 12 Sep 2020 10:06:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A50CA75120;
	Sat, 12 Sep 2020 10:06:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50923181A07C;
	Sat, 12 Sep 2020 10:06:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08CA5orE002292 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Sep 2020 06:05:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 642B0F641C; Sat, 12 Sep 2020 10:05:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDE2F640A
	for <dm-devel@redhat.com>; Sat, 12 Sep 2020 10:05:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9CDA101A53F
	for <dm-devel@redhat.com>; Sat, 12 Sep 2020 10:05:47 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-117-a4CUDLn4M4iQmZo9KUPYgw-1; Sat, 12 Sep 2020 06:05:45 -0400
X-MC-Unique: a4CUDLn4M4iQmZo9KUPYgw-1
Received: by mail-wm1-f65.google.com with SMTP id w2so6491173wmi.1
	for <dm-devel@redhat.com>; Sat, 12 Sep 2020 03:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=90YY4GCj9MCnBhlZ4jV2qidPe5U41jo2zEaDvX7aM4Q=;
	b=dHRV83XJh8wu/45SWYvOqlVy9OmlAaRmZsuwA0KKsOpVsFHgRTgHq6CKphkiwNtVfp
	M5AqEbmkaK3i9OG+VOjlHtx324dY4TGKcstMs5j4sNYE5tUmMkmBTUPAKmYphZ5IrkvZ
	BcDbjnpqTTqDeVrZUyNRHvWIKet+ba2WagbSXM/PzaInxQwIF/3u5rfL/7iJIVzuzP/D
	QTHYHWCiDTvz9opcyNZ3Cs9wB5D4GHaBjRi2WvnRJx3S5Z2Y8bQRATW1T5itrMb0LdrJ
	o1MMhSw8St7x0aR1C8GreQIQo/UeUYNSkFGWtHFJQEL4fN5bOAf2l3VGoqHK1h/IxWyQ
	6vYg==
X-Gm-Message-State: AOAM532C92j4dZXdSI2cCw20YSUn2zbk1nZq2321SmbnotUcvOWTwpIO
	7YyGkz5VELgb+wmldUpk7oh+b5me7XE=
X-Google-Smtp-Source: ABdhPJyDSYSL38ztFT/ifkvFTAaj69PVwgFWPuQ3uh4U3wXSLEJZqcgtFocTHkqjd3xwrhX28BgaTw==
X-Received: by 2002:a05:600c:2118:: with SMTP id
	u24mr6126485wml.59.1599905143839; 
	Sat, 12 Sep 2020 03:05:43 -0700 (PDT)
Received: from [192.168.8.102] (37-48-59-155.nat.epc.tmcz.cz. [37.48.59.155])
	by smtp.gmail.com with ESMTPSA id
	b187sm9154522wmb.8.2020.09.12.03.05.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 12 Sep 2020 03:05:42 -0700 (PDT)
To: Ard Biesheuvel <ardb@kernel.org>,
	"Van Leeuwen, Pascal" <pvanleeuwen@rambus.com>, dm-devel@redhat.com
References: <20200911141103.14832-1-ardb@kernel.org>
	<CY4PR0401MB3652AD749C06D0ACD9F085F3C3240@CY4PR0401MB3652.namprd04.prod.outlook.com>
	<CAMj1kXHOrGoGv6Tse9Vju9mTV_+ks8cUMqx_iSQHPfc+2DVkmw@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <ddbf295b-1e02-6553-0d78-5543923ba100@gmail.com>
Date: Sat, 12 Sep 2020 12:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXHOrGoGv6Tse9Vju9mTV_+ks8cUMqx_iSQHPfc+2DVkmw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "ebiggers@kernel.org" <ebiggers@kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] [PATCH] crypto: mark unused ciphers as obsolete
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 11/09/2020 18:30, Ard Biesheuvel wrote:
> (cc Milan and dm-devel)
> 
> On Fri, 11 Sep 2020 at 19:24, Van Leeuwen, Pascal
> <pvanleeuwen@rambus.com> wrote:
>>
>>> -----Original Message-----
>>> From: linux-crypto-owner@vger.kernel.org <linux-crypto-owner@vger.kernel.org> On Behalf Of Ard Biesheuvel
>>> Sent: Friday, September 11, 2020 4:11 PM
>>> To: linux-crypto@vger.kernel.org
>>> Cc: herbert@gondor.apana.org.au; ebiggers@kernel.org; Ard Biesheuvel <ardb@kernel.org>
>>> Subject: [PATCH] crypto: mark unused ciphers as obsolete
>>>
>>> <<< External Email >>>
>>> We have a few interesting pieces in our cipher museum, which are never
>>> used internally, and were only ever provided as generic C implementations.
>>>
>>> Unfortunately, we cannot simply remove this code, as we cannot be sure
>>> that it is not being used via the AF_ALG socket API, however unlikely.
>>> So let's mark the Anubis, Khazad, SEED and TEA algorithms as obsolete,
>>>
>> Wouldn't the IKE deamon be able to utilize these algorithms through the XFRM API?
>> I'm by no means an expert on the subject, but it looks like the cipher template is
>> provided there directly via XFRM, so it does not need to live in the kernel source.
>> And I know for a fact that SEED is being used for IPsec (and TLS) in Korea.
>>
> 
> I have been staring at net/xfrm/xfrm_algo.c, and as far as I can tell,
> algorithms have to be mentioned there in order to be usable. None of
> the ciphers that this patch touches are listed there or anywhere else
> in the kernel.
> 
>> The point being, there are more users to consider beyond "internal" (meaning hard
>> coded in the kernel source in this context?) and AF_ALG.
>>
> 
> That is a good point, actually, since dm-crypt could be affected here
> as well, hence the CCs.
> 
> Milan (or others): are you aware of any of these ciphers being used
> for dm-crypt?

Cryptsetup/dm-crypt can use them (talking about Seed, Khazad, Anubis, TEA), but I think
there is no real use of these.
(IOW these are used only if someone deliberately uses them - manually specifying on format.)

For dm-crypt. there should be no big harm if these are marked obsolete.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

