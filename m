Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 316DA5B83E
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 11:44:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 143BB3092649;
	Mon,  1 Jul 2019 09:43:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D38F67D580;
	Mon,  1 Jul 2019 09:43:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7046819725;
	Mon,  1 Jul 2019 09:42:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x619frLk028709 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 05:41:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA22B1001B14; Mon,  1 Jul 2019 09:41:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FDBB1001B1B;
	Mon,  1 Jul 2019 09:41:49 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74D4D30832E6;
	Mon,  1 Jul 2019 09:41:40 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f17so15117548wme.2;
	Mon, 01 Jul 2019 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=6mj1GNCBlm5Kzl/Gv47qDDxI924Jr5t8ezQS95HGAxE=;
	b=RMrB1vsX/2hK+on0/p7Z7GxznCyEy8+F457kddIrwKQwlCyrQQxmFpdyIB7KPTFSrI
	1UEEwV35Lu1CwDmb2s+W4OV+NkzstIuw8Cc63+MTmhAkrLOTiGJ1qG16J4JvqTAEsrSs
	uZnWKKrQgeqZdO/mh9YOy2EoWVT//ZMAZ8eHGu9m2sZo312GQ3vgDEcVGV8kekxPtJMN
	rv0CFJjViOmLgWPsk0vUPM+G4Qtu0X7i8ze6FzUMeBgTwPapqt1nU/op3JD7L/rym6eB
	LO9RSQlwXNBw4IS2pP/gIgz2ZEOQZYuk+kM5QZ6v7wLL6Ud/9JPtH+DTjO8Md5KsnlAx
	l+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6mj1GNCBlm5Kzl/Gv47qDDxI924Jr5t8ezQS95HGAxE=;
	b=Bc+nh8N7oCoiK4xpEuwzwfrVx2/HrTfnbMAwnkStL0lHcASddCVNFVoSPIKaMBSrAa
	lA+5ASwbtJI1yQlWX2KEZNVlMrrECQHj1wljxv0pUlhybCn984gvXLwbhdfmBww1Zyf0
	BH7H/DgYd1HvlcynXgbyzOCQjmdkhCmqTOLNYt+j4Flfemgm6fCWyhgQIBjCGxUGh0kW
	DvkvWXGogsUfjIt4xR4rM6U/uuqcDHUeQJ/N7tIhzzyS8IXob1k+iTpqSR+Jyyf3MF/k
	bh/yqamc+qW+MR+Tz8fWwak3p7kjyiEZapwWUczsyYdpQw2KXjhA3H66tk5SuFeeeFrk
	VnCg==
X-Gm-Message-State: APjAAAVS5nNvn+2LudNLEhXcIiCUBIM8uk6u5gcqJozmn82MVtP45T2v
	8h+xJSDqkEK1gkOaZiMjgFZM43SO89K4Mw==
X-Google-Smtp-Source: APXvYqw1GiG2c1p4SOty1AL+8QolpaF03Qeti32qNeBWi0z+owqwU83+3Kt9KKC6JMz4wuXTHDVY/A==
X-Received: by 2002:a1c:3:: with SMTP id 3mr16735741wma.6.1561974098900;
	Mon, 01 Jul 2019 02:41:38 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id 5sm5860353wmi.22.2019.07.01.02.41.37
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Jul 2019 02:41:38 -0700 (PDT)
To: James Morris <jmorris@namei.org>, Eric Biggers <ebiggers@kernel.org>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190628040041.GB673@sol.localdomain>
	<alpine.LRH.2.21.1906282040490.15624@namei.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <749ddf56-3cb6-42c8-9ccc-71e09558400f@gmail.com>
Date: Mon, 1 Jul 2019 11:41:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1906282040490.15624@namei.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 01 Jul 2019 09:41:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Mon, 01 Jul 2019 09:41:40 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com, Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: Re: [dm-devel] [RFC PATCH v5 0/1] Add dm verity root hash pkcs7 sig
	validation.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 01 Jul 2019 09:44:09 +0000 (UTC)

On 29/06/2019 06:01, James Morris wrote:
> On Thu, 27 Jun 2019, Eric Biggers wrote:
> 
>> I don't understand your justification for this feature.
>>
>> If userspace has already been pwned severely enough for the attacker to be
>> executing arbitrary code with CAP_SYS_ADMIN (which is what the device mapper
>> ioctls need), what good are restrictions on loading more binaries from disk?
>>
>> Please explain your security model.
> 
> Let's say the system has a policy where all code must be signed with a 
> valid key, and that one mechanism for enforcing this is via signed 
> dm-verity volumes. Validating the signature within the kernel provides 
> stronger assurance than userspace validation. The kernel validates and 
> executes the code, using kernel-resident keys, and does not need to rely 
> on validation which has occurred across a trust boundary.

Yes, but as it is implemented in this patch, a certificate is provided as
a binary blob by the (super)user that activates the dm-verity device.

Actually, I can put there anything that looks like a correct signature (self-signed
or so), and dm-verity code is happy because the root hash is now signed.

Maybe could this concept be extended to support in-kernel compiled certificates?

I like the idea of signed root hash, but the truth is that if you have access
to device activation, it brings nothing, you can just put any cert in the keyring
and use it.

Milan

> 
> You don't need arbitrary CAP_SYS_ADMIN code execution, you just need a 
> flaw in the app (or its dependent libraries, or configuration) which 
> allows signature validation to be bypassed.
> 
> The attacker now needs a kernel rather than a userspace vulnerability to 
> bypass the signed code policy.
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
