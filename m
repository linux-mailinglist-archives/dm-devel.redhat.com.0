Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EED7A80BC
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 13:02:07 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76C588AC6FF;
	Wed,  4 Sep 2019 11:02:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CAF6600CD;
	Wed,  4 Sep 2019 11:01:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A8091802218;
	Wed,  4 Sep 2019 11:01:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84B1cnY018137 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 07:01:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF87B6012D; Wed,  4 Sep 2019 11:01:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B4AE60127;
	Wed,  4 Sep 2019 11:01:34 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C79603C919;
	Wed,  4 Sep 2019 11:01:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o184so3153804wme.3;
	Wed, 04 Sep 2019 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aiCDqJNilYcMlqpj9RhS+m7CTUNRMuH0wMXQB4/ydNs=;
	b=AJvJyEe3o4RSGAQNm7ptP1O9prm45dP1+pi00k0IfH3U/XrhBxx7zwLVXtSjob/dui
	MggxUaQ0PbxWippH3czqsid6AltkQG8NJyvvbV42/4ysz0VuxLKjr75ukbx02Lc73cz+
	19ccaj3MQB44iWLwj9BYme9iPt46NnpjzEGZC+Er4ZBg/gefJXGZXUCODbPaQ52a5Ke2
	ISRc4EgSYUdogV4/Gk/5kbiy91X82gAHRJHBizyKWsAxncG1dFGlTzdulwfmIZcMHSen
	9Rd2U2BJGaiEgoV3hSvF1XfAZkkX+Fm6KVlzejqaQKW1eR50Qo9rHplFkqZANA9WI8oB
	Z/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aiCDqJNilYcMlqpj9RhS+m7CTUNRMuH0wMXQB4/ydNs=;
	b=NhKscIcwCzQQHa1QL8q+f2HupeKoCjDZ+ei6dx/Eh4uVCOOcydh09FzQHuasBwB5Ux
	4k8/ctbf5Bm4l2ViJc87hXXyZJWj52PvHtSj9AEMwgxtm6B+hlbhdQf79oKX72BNjpN9
	ebjjRaImDZSXjKk4Ht1Rh0zL4VaBelvg2HkhvZy5y1VmpGkkD/gQAdSbbz74elqKSnah
	BXPdUvomEYCHL6afKieaukYxWHYs5hyRZct3z6AlaW07EL1wlL3U32CONTszOW06mw3e
	tpQTvaNWK4BjS+eB1LYHVQ3KBnHRXN6d/ZiyaPhlDwRW5yrFiG4Bva26QrP+qOlstk6J
	wNyg==
X-Gm-Message-State: APjAAAU6A/UKXIHvgMquSVC/wcqEeQQ8FjNgWyKpr0gAxfKZDYpQ+wtz
	ISxxgvznXsiwCofJGN6x1CofHJ+A
X-Google-Smtp-Source: APXvYqyxoU5bw4NMVPG7sTFGi+Sd6Ec/4zLMmAvb9SW6PPWUSkkQ4NnaA3Eu+Q68qKNxGMbGI6HLTg==
X-Received: by 2002:a05:600c:2105:: with SMTP id
	u5mr4155388wml.150.1567594891095; 
	Wed, 04 Sep 2019 04:01:31 -0700 (PDT)
Received: from [172.22.36.64] (redhat-nat.vtp.fi.muni.cz. [78.128.215.6])
	by smtp.gmail.com with ESMTPSA id
	e30sm32581785wra.48.2019.09.04.04.01.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Sep 2019 04:01:30 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
	<20190819141738.1231-7-ard.biesheuvel@linaro.org>
	<20190903185827.GD13472@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <403192f0-d1c4-0c60-5af1-7dee8516d629@gmail.com>
Date: Wed, 4 Sep 2019 13:01:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903185827.GD13472@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 04 Sep 2019 11:01:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 04 Sep 2019 11:01:33 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, dm-devel@redhat.com,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v13 6/6] md: dm-crypt: omit parsing of the
 encapsulated cipher
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Wed, 04 Sep 2019 11:02:05 +0000 (UTC)

On 03/09/2019 20:58, Mike Snitzer wrote:
> On Mon, Aug 19 2019 at 10:17am -0400,
> Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> 
>> Only the ESSIV IV generation mode used to use cc->cipher so it could
>> instantiate the bare cipher used to encrypt the IV. However, this is
>> now taken care of by the ESSIV template, and so no users of cc->cipher
>> remain. So remove it altogether.
>>
>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> 
> Acked-by: Mike Snitzer <snitzer@redhat.com>
> 
> Might be wise to bump the dm-crypt target's version number (from
> {1, 19, 0} to {1, 20, 0}) at the end of this patch too though...

The function should be exactly the same, dependencies on needed modules are set.

In cryptsetup we always report dm target + kernel version,
so we know that since version 5.4 it uses crypto API for ESSIV.
I think version bump here is really not so important.

Just my two cents :)

Anyway, thanks everyone.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
