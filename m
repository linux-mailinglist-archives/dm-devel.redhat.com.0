Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CC71E77A80
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jul 2019 18:06:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4395430BD1BB;
	Sat, 27 Jul 2019 16:05:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A94DA52FD4;
	Sat, 27 Jul 2019 16:05:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB22B1800205;
	Sat, 27 Jul 2019 16:05:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6RG4doN024070 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jul 2019 12:04:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA96A1017E30; Sat, 27 Jul 2019 16:04:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E47BD10114A1
	for <dm-devel@redhat.com>; Sat, 27 Jul 2019 16:04:37 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D31A30BC58E
	for <dm-devel@redhat.com>; Sat, 27 Jul 2019 16:04:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so54185695wrm.8
	for <dm-devel@redhat.com>; Sat, 27 Jul 2019 09:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Xufq+sg1OgKMJHpTfBvbAhf96A/Qb3kdIla9BjnF7lo=;
	b=MAUv3HvWDBa/gJgDMh1Cekd4E84H+0GJwlFWAoF4txJjzx26Izn02GszjBBVdqG1L5
	vKafDSFZTC1LbEetrs7a/xOz6654mTyu9WRiuxOQWD99c4usL5mzN9XvTJc6pe9MlKQA
	eBM1XoEDZv/bq4SNhqf6utFlLk/mSMudpzOeuz8I29A4OzyW96X0yg+JQAL9Cb4/m7ho
	RvjdqdaS1rRhsSr68Qtd95X/OywR6ZqOEZG3f7N8ihxlnidp1d3kiqgEfR+54S6zUz3i
	LdEWLRNYlpNZqPF3JxgTa9x4QUFHW2Akfl4WZEduBq7lXHJQbgKDt2zOPrdBrP8A1Cuh
	Md/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Xufq+sg1OgKMJHpTfBvbAhf96A/Qb3kdIla9BjnF7lo=;
	b=gBfx7TnKLxlXGlMublVmTccQByyqfIlD/ZpwiOCiroxXIapIK46iEOsMwaQMa7F1/E
	tW9DGvy7JNsUnIms3gAuQYFhYGz87A7cD50GkDeGF+0XUKLxmuieMCU7Ddb3ywfpl8Qg
	jnjRfoLGAVsFygW75SMtCJYfQChbTVPFrq21MU+5qpSuhhF3EeFm5s5j5Hl3EtdVWFw/
	zwTRszwwr7D+jMdSPcUUdAinDRco/+mCNQvPjLsaKLLFPn3hn5QIV9elZ8ceji9GkOOW
	qbWxAvnbYS+cGJR49ZxQvZfQWZbNdr+cPZzabXXIrsx624ifIg2HHxofKRN3AuOFbD/3
	oGwg==
X-Gm-Message-State: APjAAAUhadvGQECdWQYYjc2+Wbawy+Oj6FIRRh/Eb+8kh1wRtP4m+KN3
	KkcmpD9h7zFIMtNOgjlEnT0nnyau
X-Google-Smtp-Source: APXvYqxtYOttgKh7W5PzJ4p93lj2koGRlynUU4ePppek/JtWBvLtnoKhqq0W0YacuQgDN0UtRBa8Kw==
X-Received: by 2002:adf:f8cf:: with SMTP id
	f15mr106841807wrq.333.1564243475231; 
	Sat, 27 Jul 2019 09:04:35 -0700 (PDT)
Received: from [192.168.8.100] (78-80-26-9.nat.epc.tmcz.cz. [78.80.26.9])
	by smtp.gmail.com with ESMTPSA id
	j33sm115307879wre.42.2019.07.27.09.04.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Jul 2019 09:04:34 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
References: <20190716221639.GA44406@gmail.com>
	<20190720065807.GA711@sol.localdomain>
	<0d4d6387-777c-bfd3-e54a-e7244fde0096@gmail.com>
	<CAKv+Gu9UF+a1UhVU19g1XcLaEqEaAwwkSm3-2wTHEAdD-q4mLQ@mail.gmail.com>
	<MN2PR20MB2973B9C2DDC508A81AF4A207CAC40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
	<MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB34850A016F3228124C0D360698C00@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB29732C3B360EB809EDFBFAC5CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu9krpqWYuD2mQFBTspo3y_TwrN6Arbvkcs=e4MpTeitHA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <97532fae-4c17-bb8f-d245-04bf97cef4d1@gmail.com>
Date: Sat, 27 Jul 2019 18:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu9krpqWYuD2mQFBTspo3y_TwrN6Arbvkcs=e4MpTeitHA@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sat, 27 Jul 2019 16:04:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sat, 27 Jul 2019 16:04:36 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Horia Geanta <horia.geanta@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
 support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Sat, 27 Jul 2019 16:05:59 +0000 (UTC)

On 27/07/2019 07:39, Ard Biesheuvel wrote:
> Thanks for the additional test vectors. They work fine with my SIMD
> implementations for ARM [0], so this looks like it might be a CAAM
> problem, not a problem with the test vectors.
> 
> I will try to find some time today to run them through OpenSSL to double check.

I shamelessly copied your test vectors to my vector test for cryptsetup backend.

Both OpenSSL and gcrypt XTS implementation passed all tests here!

If interested - this is copy of backend we have in cryptsetup, vectors added in crypto-vectors.c
(there are some hard defines in Makefile, cryptsetup uses autoconf instead).
  OpenSSL: https://github.com/mbroz/cryptsetup_backend_test
  gcrypt branch: https://github.com/mbroz/cryptsetup_backend_test/tree/gcrypt

Once kernel AF_ALG supports it, I can easily test it the same way.

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
