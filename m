Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3947E89182
	for <lists+dm-devel@lfdr.de>; Sun, 11 Aug 2019 13:13:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A255308403B;
	Sun, 11 Aug 2019 11:13:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D3865D6A0;
	Sun, 11 Aug 2019 11:13:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DDF718089C8;
	Sun, 11 Aug 2019 11:13:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7BBD3gF011301 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 11 Aug 2019 07:13:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB8C6277B3; Sun, 11 Aug 2019 11:13:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6595277B2
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 11:13:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11BF8307D84D
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 11:13:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f72so9745424wmf.5
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 04:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mPou2l6/6d60x+ugqGKrLJjTouLAr6zsgM8Vh/aSpGE=;
	b=HDRvEENewEc/2utj964O4FhxALvIRbSd3HAt4ypNU1kJb95B10i61kWpID7R8o25SJ
	pKzBz7A1uVR+linBP7DId3tDeDSuX1CkpqhlJPikMGxMbiG4CaE/iFDkDJZ021e9CfOW
	CnjVzgOE+lUVAztuA4vKxcYAK7jnzWePOWFsb4UTbkMtq6nFxjBGyFpZtFHPyGZN6Gyo
	pBWcSmZVN0m/eOaaYlBqfPq+ROFznOFMjNNeMzf1tX2etiNWjcRyQpMzCqw9M5aVpfOM
	gcrs70cJVy9NfKweFeD5sthiXfhd/ZBPtxcwT1OucPC5Isgx6TxjG5QsEpsytwQPng61
	hFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mPou2l6/6d60x+ugqGKrLJjTouLAr6zsgM8Vh/aSpGE=;
	b=n19ytKNbhrUYIqTSv2G7VODUKstDbpZti7mtgIb3nsjuREzUrAh8xnTD5GzzhS5ZS4
	bXPB5hA0hQbc6awaae+Qv3ynCDO3evJE63j2JHAFihbAALsmJbIigk+3ia+xYMKKs1yF
	7nAPPYh4oMT5WSEeBU7zxmMwgFkXWSGq9x9kF1c/TGJY42GUWOcbNUKS7Z1lTNaP7SFr
	oh9svkhE3Iws0vZSO+/HgaDi0tU3nMKviq8r6pXOkMomZJLoG+Zs4h3VURWg07CkCYCu
	T0jq8L4WblAAakv9Mvw9+Wg5sc58Tda8mKlLRDHnge6XZQtnWullLQaE0onfe4jSg1NI
	yJIg==
X-Gm-Message-State: APjAAAV5B9VXidHshKJ36KhYCiDg+XkrPg0a8rqKnjPCCXmpIuHglcFR
	WIn8KwPE6AP4NKm5l1dn4pg=
X-Google-Smtp-Source: APXvYqyjgzSBdTo0ZTb1B9kBsmp7wBzSVlr+AM34CWJmX2U1bwC66ltBhvfDh8+1WzjkWcCuEEnrsg==
X-Received: by 2002:a7b:ce1a:: with SMTP id m26mr15860345wmc.60.1565521978713; 
	Sun, 11 Aug 2019 04:12:58 -0700 (PDT)
Received: from [192.168.8.101] (37-48-59-8.nat.epc.tmcz.cz. [37.48.59.8])
	by smtp.gmail.com with ESMTPSA id x20sm9980012wmc.1.2019.08.11.04.12.57
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Aug 2019 04:12:58 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
References: <CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20f4832e-e3af-e3c2-d946-13bf8c367a60@nxp.com>
	<VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190809024821.GA7186@gondor.apana.org.au>
	<CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
	<VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<CAKv+Gu-_WObNm+ySXDWjhqe2YPzajX83MofuF-WKPSdLg5t4Ew@mail.gmail.com>
	<MN2PR20MB297361CA3C29C236D6D8F6F4CAD60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-xWxZ58tzyYoH_jDKfJoM+KzOWWpzCeHEmOXQ39Bv15g@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <d6d0b155-476b-d495-3418-4b171003cdd7@gmail.com>
Date: Sun, 11 Aug 2019 13:12:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-xWxZ58tzyYoH_jDKfJoM+KzOWWpzCeHEmOXQ39Bv15g@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sun, 11 Aug 2019 11:13:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sun, 11 Aug 2019 11:13:00 +0000 (UTC) for IP:'209.85.128.48'
	DOMAIN:'mail-wm1-f48.google.com' HELO:'mail-wm1-f48.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.48 mail-wm1-f48.google.com 209.85.128.48
	mail-wm1-f48.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Horia Geanta <horia.geanta@nxp.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sun, 11 Aug 2019 11:13:37 +0000 (UTC)

On 10/08/2019 06:39, Ard Biesheuvel wrote:
> Truncated IVs are a huge issue, since we already expose the correct
> API via AF_ALG (without any restrictions on how many of the IV bits
> are populated), and apparently, if your AF_ALG request for xts(aes)
> happens to be fulfilled by the CAAM driver and your implementation
> uses more than 64 bits for the IV, the top bits get truncated silently
> and your data might get eaten.

Actually, I think we have already serious problem with in in kernel (no AF_ALG needed).

I do not have the hardware, but please could you check that dm-crypt big-endian IV
(plain64be) produces the same output on CAAM?

It is 64bit IV, but big-endian and we use size of cipher block (16bytes) here,
so the first 8 bytes are zero in this case.

I would expect data corruption in comparison to generic implementation,
if it supports only the first 64bit...

Try this:

# create small null device of 8 sectors,  we use zeroes as fixed ciphertext
dmsetup create zero --table "0 8 zero"

# create crypt device on top of it (with some key), using plain64be IV
dmsetup create crypt --table "0 8 crypt aes-xts-plain64be e8cfa3dbfe373b536be43c5637387786c01be00ba5f730aacb039e86f3eb72f3 0 /dev/mapper/zero 0"

# and compare it with and without your driver, this is what I get here:
# sha256sum /dev/mapper/crypt 
532f71198d0d84d823b8e410738c6f43bc3e149d844dd6d37fa5b36d150501e1  /dev/mapper/crypt
# dmsetup remove crypt

You can try little-endian version (plain64), this should always work even with CAAM
dmsetup create crypt --table "0 8 crypt aes-xts-plain64 e8cfa3dbfe373b536be43c5637387786c01be00ba5f730aacb039e86f3eb72f3 0 /dev/mapper/zero 0"

# sha256sum /dev/mapper/crypt 
f17abd27dedee4e539758eabdb6c15fa619464b509cf55f16433e6a25da42857  /dev/mapper/crypt
# dmsetup remove crypt

# dmsetup remove zero


If you get different plaintext in the first case, your driver is actually creating
data corruption in this configuration and it should be fixed!
(Only the first sector must be the same, because it has IV == 0.)

Milan

p.s.
If you ask why we have this IV, it was added per request to allow map some chipset-based
encrypted drives directly. I guess it is used for some data forensic things.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
