Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B17561E8
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jun 2019 07:52:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BB65308A9E2;
	Wed, 26 Jun 2019 05:52:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3016119730;
	Wed, 26 Jun 2019 05:52:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 849AB1806B0E;
	Wed, 26 Jun 2019 05:51:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5Q5n79X003512 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 01:49:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 940CE5D9D3; Wed, 26 Jun 2019 05:49:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ADCA5D9C5;
	Wed, 26 Jun 2019 05:49:03 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EADA307D846;
	Wed, 26 Jun 2019 05:48:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v14so1146087wrr.4;
	Tue, 25 Jun 2019 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xQ4ce+x35rsYY2o9p5K+v8CMy5RJxb4zWb9mr9D1IXc=;
	b=EeftxwBtaYqbVh+JKbNLa0DToX40eFgJgREQDo/Uxz1oazpBRVViaNmD/bywZm2urd
	WyXsH6lMSKRlgEwW9IjwloSyLIc9sCvrtIXbkAMQqbWLDm10T8XZ7XyDg5C84HWAlcep
	zh30vyBFsSaFGGLC8KE50rO7+I7UXPD6gvIB3Jbl5jtU3uHqImETrewK4RvWjJIR60wg
	XmjT9UDoAPpSE5N718dNjh88hXhpUFG/Ab6tWgLsW5UxzfeY4xqwdH3/7qtp9CceuWnR
	HEk+afIHsLa6JCjHsx6l7gKtxLz86GLH1Gt0IgR741fovwBbCSb8el95mqNoC7+bxT6v
	RM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xQ4ce+x35rsYY2o9p5K+v8CMy5RJxb4zWb9mr9D1IXc=;
	b=C9dJDR86R/pm2oHjQ/5oukAp0rh9O2gO651V/Yr19pJWUm2fVZqCq6rbuaVEEBz/Q6
	qGqxRm40YTXVirEDuCPtEDNJ8KWilDNd2e4lVHc0CWQSTvIfJPm4PXKBbZ63d+xMd+nQ
	4xuZ1VumdfipGIGxnl7tp5dCl5ijMmOn5K6tTyJdTxMHLKpAGJCCsZkvLkpfvvzl2MlO
	v+haCoOTFbHKIfeatvRw3+xFiYtmrbXIAY0vC/LCKWlBI0u5/YvrOh6q61rdJNLeOJ1X
	MICg491Z9I8NQDRWYHM13vDnzgb5ov1lTYjvYx3YRe52S0QCLXgtOENcMIIusyosVnAm
	x4Lw==
X-Gm-Message-State: APjAAAU7FnBq66/u5yMdMBsQ1i4rKiLQ65Jt6gltozgDVSHG+o1ae9yF
	TKfIRURS9Uif2B71byQZwoIsrvaaXJx8Bg==
X-Google-Smtp-Source: APXvYqzs68nCVLNXdvBtvfphp2c5AsFtEftsuIxWnLsNfPVw3Cgm6bUXIpmze0HkCQry6olx6IzSag==
X-Received: by 2002:adf:c541:: with SMTP id s1mr1760212wrf.44.1561528131040;
	Tue, 25 Jun 2019 22:48:51 -0700 (PDT)
Received: from [10.43.17.24] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	a84sm1236284wmf.29.2019.06.25.22.48.49
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 22:48:50 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>,
	Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
References: <20190619191048.20365-1-jaskarankhurana@linux.microsoft.com>
	<20190619191048.20365-2-jaskarankhurana@linux.microsoft.com>
	<20190625182004.GA32075@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <e0cb17cc-35f9-46e2-ca1a-1c942989ed20@gmail.com>
Date: Wed, 26 Jun 2019 07:48:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190625182004.GA32075@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 26 Jun 2019 05:48:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 26 Jun 2019 05:48:53 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.108  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: scottsh@microsoft.com, dm-devel@redhat.com, ebiggers@google.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-security-module@vger.kernel.org, mpatocka@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-integrity@vger.kernel.org,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v5 1/1] Add dm verity root hash pkcs7 sig
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Wed, 26 Jun 2019 05:52:40 +0000 (UTC)

On 25/06/2019 20:20, Mike Snitzer wrote:
> On Wed, Jun 19 2019 at  3:10pm -0400,
> Jaskaran Khurana <jaskarankhurana@linux.microsoft.com> wrote:
> 
>> The verification is to support cases where the roothash is not secured by
>> Trusted Boot, UEFI Secureboot or similar technologies.
>> One of the use cases for this is for dm-verity volumes mounted after boot,
>> the root hash provided during the creation of the dm-verity volume has to
>> be secure and thus in-kernel validation implemented here will be used
>> before we trust the root hash and allow the block device to be created.
>>
>> The signature being provided for verification must verify the root hash and
>> must be trusted by the builtin keyring for verification to succeed.
>>
>> The hash is added as a key of type "user" and the description is passed to 
>> the kernel so it can look it up and use it for verification.
>>
>> Kernel commandline parameter will indicate whether to check (only if 
>> specified) or force (for all dm verity volumes) roothash signature 
>> verification.
>>
>> Kernel commandline: dm_verity.verify_sig=1 or 2 for check/force root hash
>> signature validation respectively.
>>
>> Signed-off-by: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
> 
> Milan and/or others: could you please provide review and if you're OK
> with this patch respond accordingly?

Stand by please :)

I like the patch, I think all major problems were solved, but I still need to test it somehow.

Anyway, for the time being, I keep all ongoing patches that need some later
userspace support in my branch
https://git.kernel.org/pub/scm/linux/kernel/git/mbroz/linux.git/log/?h=dm-cryptsetup
so at least it get some automated testing.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
