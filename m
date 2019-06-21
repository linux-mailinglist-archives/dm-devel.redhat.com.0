Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3694E0A1
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jun 2019 08:46:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D15C307CB38;
	Fri, 21 Jun 2019 06:46:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B139560BEC;
	Fri, 21 Jun 2019 06:45:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 092A6206D2;
	Fri, 21 Jun 2019 06:45:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5L6iXdq001988 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 02:44:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D81DF5D739; Fri, 21 Jun 2019 06:44:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D34435B683
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 06:44:30 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35CFC2F8BC7
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 06:44:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so5413056wru.0
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 23:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=T0c/iajo/VZSQKfb3VczokbIDSIWM9pmHxJ48YeWxjM=;
	b=oelbXbyWzHjuukI+wyIvixgUy/zOkKhyd9yIlXzWtd3PNEHuXSeRRoN3DXOhtwbUoJ
	Vup6PUOykHbB/cAx0fGflV0Mdh858CGw0yBR6xrGVGywP8QkVSa43fCLy4uR9ThUIAy2
	ylCgPojfkdX4bQ36Scix1aJlB3IMjMIbXGPqTh7ReSr62tqCTYp9aUcLdNTulZerjHFE
	vBgVNgTFe3weu2D0PEEMHP779RMcCwxn9nYrF8TAhjXXZR2SaR/G/TQ6F1SBcv5L//lS
	qA1QW2EJ40lIKyc6VVWFboQdIJTIBqNDea59C0o0wB1LEQy0em2H88yOLi6KzsZFxhYV
	AGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=T0c/iajo/VZSQKfb3VczokbIDSIWM9pmHxJ48YeWxjM=;
	b=VLzvIvyWDUJky8/ehFuzzJGtAWV3u8soawPD+mW91lqdr2zsgkiTrgMksfgJa27GwO
	poPEVzEPfyeqmhaVKUg+9lUgVhkf7TxOv98vjOKZTN6R1+t7zZpeMozDO6nMIAtlF9Er
	/Zupm9FIrrpZg2xdotZ1CM9rf0fhK4RI8T0T2l9nZRehPn6qSNXD/TS/QnA36LnV+v11
	I1Ltyg29ITLPGrHeLwAvTTE78Gu805JXzvN8AL3MpyFsMDn95DGo8LpKXzE1Ghh58E+G
	HN1VxU75I+yKHPUxxIaUzjgedFwIKcVyveXQNs0JcSOZ/uk6CTEvtEe+MMT0fAEQDwVC
	pl/g==
X-Gm-Message-State: APjAAAU35Go4PsUcfEJh6NNcLY6EW5kCTnMfVDrvaBifIDo/HRqciMeg
	n+eFdmxECSUSQt6xKEoDMDA=
X-Google-Smtp-Source: APXvYqzUNhVlRMeWRb8OYwodTPHWPCSgiYh8AoPSoPUe7Z6UpPglYu0GAy68wKgG9zQNrtgPeFLatw==
X-Received: by 2002:adf:f38b:: with SMTP id m11mr28209636wro.79.1561099466836; 
	Thu, 20 Jun 2019 23:44:26 -0700 (PDT)
Received: from [192.168.8.100] (37-48-48-91.nat.epc.tmcz.cz. [37.48.48.91])
	by smtp.gmail.com with ESMTPSA id a2sm2291158wmj.9.2019.06.20.23.44.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 23:44:26 -0700 (PDT)
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
	<CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
	<20190620125339.gqup5623sw4xrsmi@gondor.apana.org.au>
	<CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
	<20190620134045.fncibzc7eyufd5sj@gondor.apana.org.au>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <8d522740-1c3c-5102-86b8-fb5428a6cb3e@gmail.com>
Date: Fri, 21 Jun 2019 08:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620134045.fncibzc7eyufd5sj@gondor.apana.org.au>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 21 Jun 2019 06:44:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Fri, 21 Jun 2019 06:44:28 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 1/6] crypto: essiv - create wrapper
 template for ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 21 Jun 2019 06:46:14 +0000 (UTC)

On 20/06/2019 15:40, Herbert Xu wrote:
> On Thu, Jun 20, 2019 at 03:02:04PM +0200, Ard Biesheuvel wrote:
>>
>> It also depend on how realistic it is that we will need to support
>> arbitrary sector sizes in the future. I mean, if we decide today that
>> essiv() uses an implicit sector size of 4k, we can always add
>> essiv64k() later, rather than adding lots of complexity now that we
>> are never going to use. Note that ESSIV is already more or less
>> deprecated, so there is really no point in inventing these weird and
>> wonderful things if we want people to move to XTS and plain IV
>> generation instead.
> 
> Well whatever we do for ESSIV should also extend to other IV
> generators in dm-crypt so that potentially we can have a single
> interface for dm-crypt multi-sector processing in future (IOW
> you don't have special code for ESSIV vs. other algos).
> 
> That is why we should get the ESSIV interface right as it could
> serve as an example for future implementations.
> 
> What do the dm-crypt people think? Are you ever going to need
> processing in units other than 4K?

For the "technical" limit, dm-crypt supports 512, 1024, 2048 and 4096-byte encryption
sector size (power of two) since commit 8f0009a225171cc1b76a6b443de5137b26e1374b.

As the commit says, the 4k limit is because of page limit where whole IO must fit
(4k is minimal page size).
I do not want to introduce devices that are created on some architecture
and cannot be opened elsewhere with a smaller page size.
But maybe some reason appears, or there is some trick we did not tried...

(I guess fs has the same limits?)

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
