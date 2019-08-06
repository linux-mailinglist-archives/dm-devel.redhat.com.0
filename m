Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA0F82FDF
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 12:44:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 652A62D6E5B;
	Tue,  6 Aug 2019 10:44:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A113B19C78;
	Tue,  6 Aug 2019 10:44:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF79E1800203;
	Tue,  6 Aug 2019 10:44:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76AhfvA012368 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 06:43:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E05895D717; Tue,  6 Aug 2019 10:43:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C9DA5D6D0;
	Tue,  6 Aug 2019 10:43:37 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F68630A00AE;
	Tue,  6 Aug 2019 10:43:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 207so77702934wma.1;
	Tue, 06 Aug 2019 03:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=W39mdygRmevkyJdX3phsZeuayUumsBZQtKvu/nZsbEo=;
	b=NGNQ2izDlK+401oSnhghSh/5gboxZvAjQhmvznjiGJWObAz1KHwuOCiajFVPd5mH6C
	F+VfXZ8Pbfo5gRhTlHJwDZC+nyVLmxrS9wl639C/lSN20/b9Wj9BytkM1HLVmtp7nXKq
	/CtXNe1eY2lDU2sAPKkCVXCJIq96hWBll+FM1DI173z/iphIhm8MHkYJeuKA3CqSihlH
	TF68vOVfCtCWys5dEEpqk+YngxRMzNWuun2wt/0UHi2BZ8Y4OSBm1Ym5SfvGP3TB9Dlx
	i9cPyjT8veO2GMBXAiaJWAptFs1Aj00LFS5supYmB0WnuKgUv0kaJbbgunxK78Z61+ni
	nqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=W39mdygRmevkyJdX3phsZeuayUumsBZQtKvu/nZsbEo=;
	b=ZcgkfewFJkdrcdmrh8gaqLWqvXYRpE0FWPdHN7l86uOtq/p/jikKNPLq8a3Kplspn0
	9fK0EQDeES38d1mbqF8CYXBr6yTeQs2g5Q4S+I7sa7WBFzrQCKEhtZWlCsSzFVf+ddLT
	7RcxnVmQy/QOBIHXyLcWA73DKbvl6Wayv/BiR0o9xyqSUsqtHyG3VHn7M0jRQnTlDbvl
	OzjUOECpjBytqScmtMjknAiXOalhqvj8U8uMJ5S1yC7TRAUALIGR1F8nYIufAHMPeqIT
	ToxCOHgbV2yGk84We9AuqyRZ/fy+E8ytFGxBw9Vwq66u58+n7QUFSWR77Swi5W+zQocA
	AwhQ==
X-Gm-Message-State: APjAAAWqGr7HxHvbkvEkI9+6rz7d0RsqX3re98xG9i500tdBLRhk6Sqm
	M1+yLb75hNe0U1XmXSNbRQMmhX+D
X-Google-Smtp-Source: APXvYqybZlyyzNQJB5Mm/f8y4J3GBeKOWvL8vkkiPshrlDxObNTMCs8GsL1nIj+/mDHz+tyIhF1PQg==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr3790500wmg.159.1565088214709; 
	Tue, 06 Aug 2019 03:43:34 -0700 (PDT)
Received: from [10.43.17.10] (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.gmail.com with ESMTPSA id
	y16sm185415950wrg.85.2019.08.06.03.43.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 03:43:34 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-crypto@vger.kernel.org
References: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
	<20190806080234.27998-3-ard.biesheuvel@linaro.org>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <22f5bfd5-7563-b85b-925e-6d46e7584966@gmail.com>
Date: Tue, 6 Aug 2019 12:43:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806080234.27998-3-ard.biesheuvel@linaro.org>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 06 Aug 2019 10:43:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 06 Aug 2019 10:43:36 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: ebiggers@kernel.org, snitzer@redhat.com, dm-devel@redhat.com,
	herbert@gondor.apana.org.au, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 2/2] md/dm-crypt - switch to AES library
	for EBOIV
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 06 Aug 2019 10:44:34 +0000 (UTC)

On 06/08/2019 10:02, Ard Biesheuvel wrote:
> The EBOIV IV mode reuses the same AES encryption key that is used for
> encrypting the data, and uses it to perform a single block encryption
> of the byte offset to produce the IV.
> 
> Since table-based AES is known to be susceptible to known-plaintext
> attacks on the key, and given that the same key is used to encrypt
> the byte offset (which is known to an attacker), we should be
> careful not to permit arbitrary instantiations where the allocated
> AES cipher is provided by aes-generic or other table-based drivers
> that are known to be time variant and thus susceptible to this kind
> of attack.
> 
> Instead, let's switch to the new AES library, which has a D-cache
> footprint that is only 1/32th of the generic AES driver, and which
> contains some mitigations to reduce the timing variance even further.

NACK.

We discussed here that we will not limit combinations inside dm-crypt.
For generic crypto API, this policy should be different, but I really
do not want these IVs to be visible outside of dm-crypt.

Allowing arbitrary combinations of a cipher, mode, and IV is how dm-crypt
works since the beginning, and I really do not see the reason to change it.

This IV mode is intended to be used for accessing old BitLocker images,
so I do not care about performance much.

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
