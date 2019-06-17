Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 574CB489BB
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 19:10:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E46B030C1328;
	Mon, 17 Jun 2019 17:09:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0FB07DDA0;
	Mon, 17 Jun 2019 17:09:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F7DE206D2;
	Mon, 17 Jun 2019 17:08:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HH6DKF013524 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 13:06:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2748A58CB0; Mon, 17 Jun 2019 17:06:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 217A55B6BF
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 17:06:10 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F667307D874
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 17:05:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p11so10804636wre.7
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 10:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lvgi3+MQpM39FRojWazLhVvXezLQFMNFRlMRkueq/IA=;
	b=TxjoaKSD5m7bbK0Ih6BMmri+IaS5q+Ny+TFg8Gks5rIBqgGe2z3kV9mvy0d6exbcNP
	aJT2NQySaV8BAnqHAuXv4h4Nqx1H7TxFvtMqRNtOjc2RNZWInHZgqxvGjiKYOAhOvI6j
	Gv9uDdha/tJomPbIALK6ispRrcheUinwcrpynnjDxnFTZudsffVMK4n5pCPOXGK1adtu
	JDB3c29gfzY6S1K7hOj9ROoPwMTAaRKPer6hNujCe7jMnQHAPC4Vews0ca4/Plb396Iw
	QvkSBGqPnvQ/47zRhczZlPValAMW7y73+iZDdWivWjSSyLm+8G9pWyjU7GFfc1fSMXE8
	7wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lvgi3+MQpM39FRojWazLhVvXezLQFMNFRlMRkueq/IA=;
	b=kDYwTGDv+Yu5jNN1iN6iHQXfKnj1Yi4TAzVtmSlSxGcM7zuRHh9f7lLNKXmu1DB8Dk
	+KaBPfskSVeBrfHLd7THU7CK9amytopXN7f0UbT51Nqhw/pgjfONctKnlsqFjAWVO8M+
	mzQWms/0LF3BP+qpDpNOPjngQy2roCqHTlm+30jJ8skz54ST/NROUMIGRkAjNveLTSWO
	omtNNTcfNthkeTZNjLGUUlS6EEcfkkQ4oOfSy3reweiT9chPUQYELLbKOXaRg/GOMCuq
	i20AZ3wisVGdS1TYjBWsCgWeO4WDFPpYwQ57gw9g3Xe2jQhAAGnOm80uklHg7eDtTXfd
	7kGA==
X-Gm-Message-State: APjAAAVD6uqUHCksELxDzcDJMSKcsmulPiH8r7mGyCbWwVPKkTh8hPVL
	Z58Qjf0Zpd9rd2vKaKd5cKU=
X-Google-Smtp-Source: APXvYqzi0lLsm2064v1e5vDyLtdJ8bwCyUjazq2dKJytAV5jDeZySSDFNCf3pFZETLZqzrpwnpLjsw==
X-Received: by 2002:adf:f946:: with SMTP id q6mr25621385wrr.109.1560791153693; 
	Mon, 17 Jun 2019 10:05:53 -0700 (PDT)
Received: from [192.168.2.28] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	o14sm10435129wrp.77.2019.06.17.10.05.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 10:05:52 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Milan Broz <gmazyland@gmail.com>
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
	<CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
	<CAKv+Gu-LFShLW-Tt7hwBpni1vQRvv7k+L_bpP-wU86x88v+eRg@mail.gmail.com>
	<90214c3d-55ef-cc3a-3a04-f200d6f96cfd@gmail.com>
	<CAKv+Gu82BLPWrX1UzUBLf7UB+qJT6ZPtkvJ2Sa9t28OpXArhnw@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <af1b7ea1-bc98-06ff-e46c-945e6bae20d8@gmail.com>
Date: Mon, 17 Jun 2019 19:05:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu82BLPWrX1UzUBLf7UB+qJT6ZPtkvJ2Sa9t28OpXArhnw@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 17 Jun 2019 17:05:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 17 Jun 2019 17:05:55 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 17 Jun 2019 17:10:36 +0000 (UTC)

On 17/06/2019 16:39, Ard Biesheuvel wrote:
>>
>> In other words, if you add some additional limit, we are breaking backward compatibility.
>> (Despite the configuration is "wrong" from the security point of view.)
>>
> 
> Yes, but breaking backward compatibility only happens if you break
> something that is actually being *used*. So sure,
> xts(aes)-essiv:sha256 makes no sense but people use it anyway. But is
> that also true for, say, gcm(aes)-essiv:sha256 ?

These should not be used.  The only way when ESSIV can combine with AEAD mode
is when you combine length-preserving mode with additional integrity tag, for example

  # cryptsetup luksFormat -c aes-cbc-essiv:sha256 --integrity hmac-sha256 /dev/sdb

it will produce this dm-crypt cipher spec:
  capi:authenc(hmac(sha256),cbc(aes))-essiv:sha256

the authenc(hmac(sha256),cbc(aes)) is direct crypto API cipher composition, the essiv:sha256
IV is processed inside dm-crypt as IV.

So if authenc() composition is problem, then yes, I am afraid these can be used in reality.

But for things like gcm(aes)-essiv:sha256 (IOW real AEAD mode with ESSIV) - these are
not supported by cryptsetup (we support only random IV in this case), so these should
not be used anywhere.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
