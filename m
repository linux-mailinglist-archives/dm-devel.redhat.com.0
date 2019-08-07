Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F4846F3
	for <lists+dm-devel@lfdr.de>; Wed,  7 Aug 2019 10:17:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5F8F7C840;
	Wed,  7 Aug 2019 08:17:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47ABC26186;
	Wed,  7 Aug 2019 08:17:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D19792551B;
	Wed,  7 Aug 2019 08:17:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x77899AG021851 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 7 Aug 2019 04:09:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A9F21FD3A; Wed,  7 Aug 2019 08:09:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE96D1FD3C;
	Wed,  7 Aug 2019 08:09:03 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF82D7CB80;
	Wed,  7 Aug 2019 08:09:01 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c2so87153011wrm.8;
	Wed, 07 Aug 2019 01:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fG52fuDXQj1Bi6oU2rMeiQi7jmehOcFj549DOFtvvcA=;
	b=uI8uJ3cFRakpHP5sOZnNR63nmlglCor5vipRBkY7I91V9JYMXWdFCSiqKJZN822YzV
	HdwCpwKs2ez0RnrUhW1O8vkLAUNP6pe96NO4eLD9sREE948FdN4D8RFOfvrtuG6b8OC+
	9ykQ6vXX01glmYwZm2ifOuHNMP/sQr1Z3K8THBIjImDXr8fNlJ7QblsCR9vhVTbEHnAi
	2ydW9h/OW+vQYmICUvDy2ZIAhFOP0qxOx2XJ0qPc2c6P/bLEuog3IGw+pnkqPVkQ78GA
	/jqoE8FSJBbJD4Z09bC0gX6ZT4Tz7HozI0JnpLsLZT7nc2c8w1VghLA4zdj4bEBIUKpu
	VUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fG52fuDXQj1Bi6oU2rMeiQi7jmehOcFj549DOFtvvcA=;
	b=S6WrHJhjkoBtb1FrBBa7klqeazaY9qHKrk5KIAR2VmxB6IfmHE9ig+7h3qr0yjSugz
	f1b6tB94YnDwUmU/IogbLvrRTe/XvBKDkEHOo+rpjh0MiZVPZIdQ/O+ZgW+6daNqzmqK
	R+UBrNqdtaDi2bpk+YevKMsOxDGdunPVS+3e/yIExN0DBi3joXtsWU4lOQU/I6EL3eb+
	oLmW2bQt9W+CysAdC6IOpPczO5pGWVY8dIbITLANYmaG5Ab/bWa/ee1zApIy+QvBV9/i
	fPmoaNUMGU/BjFKW79EUTB0wcNP4fAlHTHzHkDfSIieWJqREYUmuzYKmjntT3rRHuhsc
	PGWA==
X-Gm-Message-State: APjAAAWZkWPdOiEJDeTnsz3yFoKYE48ipXbhFHWXJm9TJpitXIaXjtBG
	eQmQ8dKvNfoZJpZ7vfUtAcxY7U+GUJQ=
X-Google-Smtp-Source: APXvYqyv3Q+2JHo68IMU5YGZW4nZr/gEHF60B6klf9P96GJwa7Z8eCIlUSoK6v4OTKQKGumwnTvgbw==
X-Received: by 2002:adf:ef49:: with SMTP id c9mr9492849wrp.188.1565165340088; 
	Wed, 07 Aug 2019 01:09:00 -0700 (PDT)
Received: from [10.43.17.10] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id z6sm2377162wmz.46.2019.08.07.01.08.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Aug 2019 01:08:59 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <c83ec561-4359-3f38-3da3-65f9f18c1822@gmail.com>
Date: Wed, 7 Aug 2019 10:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 07 Aug 2019 08:09:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Wed, 07 Aug 2019 08:09:02 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: ebiggers@kernel.org, snitzer@redhat.com, dm-devel@redhat.com,
	herbert@gondor.apana.org.au, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher
 for IV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 07 Aug 2019 08:17:40 +0000 (UTC)

On 07/08/2019 07:50, Ard Biesheuvel wrote:
> Instead of instantiating a separate cipher to perform the encryption
> needed to produce the IV, reuse the skcipher used for the block data
> and invoke it one additional time for each block to encrypt a zero
> vector and use the output as the IV.
> 
> For CBC mode, this is equivalent to using the bare block cipher, but
> without the risk of ending up with a non-time invariant implementation
> of AES when the skcipher itself is time variant (e.g., arm64 without
> Crypto Extensions has a NEON based time invariant implementation of
> cbc(aes) but no time invariant implementation of the core cipher other
> than aes-ti, which is not enabled by default)
> 
> This approach is a compromise between dm-crypt API flexibility and
> reducing dependence on parts of the crypto API that should not usually
> be exposed to other subsystems, such as the bare cipher API.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Yes, this is a good idea, I'll test it. Thanks!

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
