Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0639289812
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 09:45:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B2CC30BC58A;
	Mon, 12 Aug 2019 07:45:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C925E69FAF;
	Mon, 12 Aug 2019 07:45:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1FEC18005B9;
	Mon, 12 Aug 2019 07:45:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7C7irDn008992 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 03:44:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9C221000337; Mon, 12 Aug 2019 07:44:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4AC51001284
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 07:44:51 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55D1219CFF5
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 07:44:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p17so103684421wrf.11
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 00:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=OhVdiPgQteGnfIdg/BzXWc5BJR5a7K5kl8o5O+S23zA=;
	b=r1jtMvZ9jhoJPy9hDsGIBBNm+hpcmV9G+1pklBjb6Kec5H4LT+5spFLbW9+mYD8lJa
	jLk647pvhccAwgkKS/nWvPNzEAuaRevgM8wFgRNzk/C6P4IXjKj2LC+YG/Zh7HwR+7vT
	J4PdXf11cxfYr+3zK6eGeCzd4Qi3p8ivQ4zukHFB+Cewdp4dD1dpuSidDEfRYNVtRqdi
	oYb8bTDCvqabSwAdyKlns+c5BMNub62RZy7QDkhOAM9AxtiGdfdB5tKGMFRJcWPPbY/A
	9myhrgXnUoEIox5M/NJTzDejt8M1oX+4zP4wO85Sp1yAbV7A80VvSnTYiRUekLYwnynj
	wJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=OhVdiPgQteGnfIdg/BzXWc5BJR5a7K5kl8o5O+S23zA=;
	b=KyJV/INHBWXSeiuU0jSGJkYgPJeUoGcVGG4IFZnPQm8r5AhC21qSsIxWMywiVhcEdh
	GNz2SYYTCLHvfc13YZoq6RMiIb7pZasds6F+X5zfn0vXRScznQe13KeObKWPM4vEpGXq
	vlRZy0V/haqEqJ8YsVlZ6xRqK6kYg+qC7DllpeXWynNIBqC4BCE1KXXrLsq/na4j8lN+
	CYE9jYgAGKrle/cwourcWoveehE8laBn8rpNiZNf+AD0xqE3nUtFQJa4kpcWk9r1EKNB
	7arBRFR/jTDBGKoRPARU3xQixhQV9xsmgkkuoExx8HAlUoaGJyQMkktMxCXJ6uyVax7w
	e9xw==
X-Gm-Message-State: APjAAAUSv0UrvPa6yAwSIJhp59ZEQivT0z6ExIFMCZ2FPE2WSLRHhn3c
	Yfxt9pJWXfD6lHhNn/HTy1A=
X-Google-Smtp-Source: APXvYqxlN5d6yAirknE/yDWW8X5nwI1whb4u1/YYAbluKe3IMvHS89FjVjXtmpxFxhpQnsl8qShMNA==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr31737059wrs.82.1565595889035; 
	Mon, 12 Aug 2019 00:44:49 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	c15sm50995266wrb.80.2019.08.12.00.44.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 00:44:48 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190810094053.7423-1-ard.biesheuvel@linaro.org>
	<20190810094053.7423-4-ard.biesheuvel@linaro.org>
	<8679d2f5-b005-cd89-957e-d79440b78086@gmail.com>
	<CAKv+Gu-ZPPR5xQSR6T4o+8yJvsHY2a3xXZ5zsM_aGS3frVChgQ@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <82a87cae-8eb7-828c-35c3-fb39a9abe692@gmail.com>
Date: Mon, 12 Aug 2019 09:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-ZPPR5xQSR6T4o+8yJvsHY2a3xXZ5zsM_aGS3frVChgQ@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 12 Aug 2019 07:44:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 12 Aug 2019 07:44:50 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v9 3/7] md: dm-crypt: switch to ESSIV crypto
	API template
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 12 Aug 2019 07:45:16 +0000 (UTC)

On 12/08/2019 08:54, Ard Biesheuvel wrote:
> On Mon, 12 Aug 2019 at 09:33, Milan Broz <gmazyland@gmail.com> wrote:
>> Try for example
>> # cryptsetup luksFormat /dev/sdc -c aes-cbc-essiv:sha256 --integrity hmac-sha256 -q -i1
>>
>> It should produce Crypto API string
>>   authenc(hmac(sha256),essiv(cbc(aes),sha256))
>> while it produces
>>   essiv(authenc(hmac(sha256),cbc(aes)),sha256)
>> (and fails).
>>
> 
> No. I don't know why it fails, but the latter is actually the correct
> string. The essiv template is instantiated either as a skcipher or as
> an aead, and it encapsulates the entire transformation. (This is
> necessary considering that the IV is passed via the AAD and so the
> ESSIV handling needs to touch that as well)

Hm. Constructing these strings seems to be more confusing than dmcrypt mode combinations :-)

But you are right, I actually tried the former string (authenc(hmac(sha256),essiv(cbc(aes),sha256)))
and it worked, but I guess the authenticated IV (AAD) was actually the input to IV (plain sector number)
not the output of ESSIV? Do I understand it correctly now?

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
