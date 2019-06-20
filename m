Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D814CCF0
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 13:32:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 236843001702;
	Thu, 20 Jun 2019 11:31:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C375D9D2;
	Thu, 20 Jun 2019 11:31:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20B901806B0E;
	Thu, 20 Jun 2019 11:31:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KBUCOd032674 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 07:30:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAE775D9E5; Thu, 20 Jun 2019 11:30:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C60D25D9D2
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:30:10 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4189E30860CF
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:30:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u8so2801363wmm.1
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 04:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pS5S9mCD3ELnfbNEhV9YPpFLxOX8S/sVLcPGWO1xWlU=;
	b=CzMyp6Accmw+rOsbIWW8YexNrQvVEiduw35vfculij9cJWb2Ii4BoAFUiJ1uM0puXH
	Wm6F20L9zmZKfIj8g9sL32cDSl61RlCD5qSJB88JI8tr4BP3O5ZAshMUJ6bMSY7wpC0J
	WqARKiG6cKxhsht0na8YMV9UluzlxB/9bGVnm0XqamznEBQvOop2zM7nE9+wshm9N1r+
	AhgrqsETQ6fvtBpdvox7GAiir7/Nm4CaZK5pwNL7SA/jggxybl2nBPQeH1zVxqEbDbAl
	nsKb+vONxleVSctB95Ago/EE+V1mn2ANqok296NRAZzvTS/UsdiZ+Rjpum5twXz7OIj9
	yuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=pS5S9mCD3ELnfbNEhV9YPpFLxOX8S/sVLcPGWO1xWlU=;
	b=LLbXvFYiRlVajG2dW8QN9YBSgbzZRBlrNFlzq/WsUzysYczIBb5oHtHBXqZ5fh+y8x
	xleSQIPA2tclXgivYRHCYnGC19oJEufHmzGVoBTRk2RVh503P/1TUsvbpt+Ha3uprzR9
	Ny6ghR/XAiWeDchzgViw8tZLSR+rTCbVp//b0Bkb49iK7wXZylnuvt31X/XBVtEt94/G
	n+scWk/Ptn7i17rJqK2SQtPUh443vij6fJ2thFJnCnPnW2KA/HNePzLKqQ46phoGizNE
	4EqT2VVFQ6rpkVlW7MaK5wVphUmirTTjY+7e29VNbTBqhtDn/PcNB3pYRUixAV44A18V
	MUtA==
X-Gm-Message-State: APjAAAUWfdrUXthHdrWn7YCy1ak9XqCr1Smh4W20a1z/npWGbtHicXLw
	IROn2hglOdOY3PHOSbFYo7I=
X-Google-Smtp-Source: APXvYqznP6WHtpYtJyJi9GFxJNaxps6TOLDTpjuZYIoRdsnWIN1xkd4nGw94wBVXwc4F8aCvQi69aw==
X-Received: by 2002:a1c:6555:: with SMTP id z82mr2619967wmb.129.1561030200877; 
	Thu, 20 Jun 2019 04:30:00 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id c1sm6140007wrh.1.2019.06.20.04.29.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 04:30:00 -0700 (PDT)
To: Eric Biggers <ebiggers@kernel.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-7-ard.biesheuvel@linaro.org>
	<20190619223710.GC33328@gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <ed3113fb-8f5f-7045-75ba-b63e4ed669ff@gmail.com>
Date: Thu, 20 Jun 2019 13:29:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619223710.GC33328@gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 20 Jun 2019 11:30:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 20 Jun 2019 11:30:02 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 6/6] crypto: arm64/aes - implement
 accelerated ESSIV/CBC mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Thu, 20 Jun 2019 11:32:00 +0000 (UTC)


On 20/06/2019 00:37, Eric Biggers wrote:
> On Wed, Jun 19, 2019 at 06:29:21PM +0200, Ard Biesheuvel wrote:
>> Add an accelerated version of the 'essiv(cbc(aes),aes,sha256)'
>> skcipher, which is used by fscrypt, and in some cases, by dm-crypt.
>> This avoids a separate call into the AES cipher for every invocation.
>>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> 
> I'm not sure we should bother with this, since fscrypt normally uses AES-256-XTS
> for contents encryption.  AES-128-CBC-ESSIV support was only added because
> people wanted something that is fast on low-powered embedded devices with crypto
> accelerators such as CAAM or CESA that don't support XTS.
> 
> In the case of Android, the CDD doesn't even allow AES-128-CBC-ESSIV with
> file-based encryption (fscrypt).  It's still the default for "full disk
> encryption" (which uses dm-crypt), but that's being deprecated.
> 
> So maybe dm-crypt users will want this, but I don't think it's very useful for
> fscrypt.

The aes-cbc-essiv:sha256 is still default for plain cryptsetup devices
(LUKS uses XTS for several years as a default already).

The reason is compatibility with older distros (if there is no cipher mode
specification in crypttab for plain device, switching default could cause data corruption).

But I think initscripts now enforce cipher and keysize crypttab options for some time,
so I can probably switch the default to XTS for plain devices soon.
(We have already compile time option for it anyway.)

IOW intention for dm-crypt is to slightly deprecate CBC mode use for all types of devices.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
