Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5196C485B8
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 16:40:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 122F030BBE9E;
	Mon, 17 Jun 2019 14:39:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7DA17E669;
	Mon, 17 Jun 2019 14:39:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B038E1833002;
	Mon, 17 Jun 2019 14:39:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HEZZTm014468 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 10:35:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B28398274D; Mon, 17 Jun 2019 14:35:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACEA679422
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 14:35:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E65081DFC
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 14:35:22 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f17so6867709wme.2
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=22htbqOLr0XYz5dY7iw/lqEMIjyN2LQkWGZjVe5M4U8=;
	b=fI66Ni32h1PR3wfJoTAbfdZDDaLgESfZYApsZogQeUMoYJDd/Boy2vbkE6YF+k+yql
	MH8jSfByY7FJMOjuxJ2lgcG/Pos4a6jXGNzmXePYpHaEg23C9FOIWdh8LqfL0vPWnqoF
	xMry9mVJKfF2Fp4Ek+k7uhTh6mg5ojYhv7nIOHWVYs771NIyHdFRVw6Rde1WU28vDYav
	2Tc3F5hmIDFKt9CSfuEKg21KZ+Vd6k+GH5/VmStiWK/uzHW9+QOWXM5vfoJF/Fty5jmZ
	svD7pZpA+qVuRrQlU8n/L43V7xu5jWD+KLE+WG8zNC6KTi7bX/2aPy6BZhNtaJhX5bVy
	ve+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=22htbqOLr0XYz5dY7iw/lqEMIjyN2LQkWGZjVe5M4U8=;
	b=d8sMkfeHSeN7CG94iQ0tbQI0U3f8aQaQohh/3P7Gy1AXRF+bKiz3lTGhY1Chvlje9u
	k8RKL9j4V/svvYXbgtbGkE4IejhspSpcl9HHXAo6eGQb7bjoWL8L4FU0179JA6pS2M/B
	STfMpVFkctQjyh/kmGkoC94HC/N3VtsfdSeWeed/qeTfCHYGhtln3LSJD+13dJEMBPGp
	NOjIODxdElQZp/Yo/LiMkpqE0XgPpEwsVlfaFcyV8/x8XfJSmXXDSTii8OHKfys8t8bv
	l39pPzVBxNbfK3ufYfvPuY+HakDKVLbcuY1oKNIgqxjVe7b+BSC7xZiXq+pr4PNjO/mc
	rdxQ==
X-Gm-Message-State: APjAAAUyL/dJt4TkziuMkZ7hmGaSdcHDL9IyBdDNqn+Y/ngwycZvvksu
	n5b7ctjEhyDYC/wMjD7nQ6Q=
X-Google-Smtp-Source: APXvYqyiWunU5GABbzLQ1ZPZBKBxDoyu00ONFMmHa1x5ZM5ZTq56hMLLh1u4keP0X1Qfw/imFppu6Q==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr20250977wmi.78.1560782120445; 
	Mon, 17 Jun 2019 07:35:20 -0700 (PDT)
Received: from [10.43.17.44] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	j18sm13561342wre.23.2019.06.17.07.35.19
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 07:35:19 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
	<CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
	<CAKv+Gu-LFShLW-Tt7hwBpni1vQRvv7k+L_bpP-wU86x88v+eRg@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <90214c3d-55ef-cc3a-3a04-f200d6f96cfd@gmail.com>
Date: Mon, 17 Jun 2019 16:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu-LFShLW-Tt7hwBpni1vQRvv7k+L_bpP-wU86x88v+eRg@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 17 Jun 2019 14:35:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Mon, 17 Jun 2019 14:35:22 +0000 (UTC) for IP:'209.85.128.44'
	DOMAIN:'mail-wm1-f44.google.com' HELO:'mail-wm1-f44.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: 1.392 * (DKIM_ADSP_CUSTOM_MED, DKIM_INVALID, DKIM_SIGNED,
	FREEMAIL_FROM, NML_ADSP_CUSTOM_MED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.44 mail-wm1-f44.google.com 209.85.128.44
	mail-wm1-f44.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 17 Jun 2019 14:40:56 +0000 (UTC)

On 17/06/2019 15:59, Ard Biesheuvel wrote:
> 
> So my main question/showstopper at the moment is: which modes do we
> need to support for ESSIV? Only CBC? Any skcipher? Or both skciphers
> and AEADs?

Support, or cover by internal test? I think you nee to support everything
what dmcrypt currently allows, if you want to port dmcrypt to new API.

I know of many systems that use aes-xts-essiv:sha256 (it does not make sense
much but people just use it).

Some people use serpent and twofish, but we allow any cipher that fits...

For the start, run this
https://gitlab.com/cryptsetup/cryptsetup/blob/master/tests/mode-test

In other words, if you add some additional limit, we are breaking backward compatibility.
(Despite the configuration is "wrong" from the security point of view.)

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
