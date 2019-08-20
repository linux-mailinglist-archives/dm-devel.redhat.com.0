Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C888995CCE
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 13:03:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1CF27F74D;
	Tue, 20 Aug 2019 11:03:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD56116929;
	Tue, 20 Aug 2019 11:03:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9A882551C;
	Tue, 20 Aug 2019 11:03:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7KB3I0X018529 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Aug 2019 07:03:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66C784274; Tue, 20 Aug 2019 11:03:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FD7E1E2
	for <dm-devel@redhat.com>; Tue, 20 Aug 2019 11:03:15 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 14FAA3090FD6
	for <dm-devel@redhat.com>; Tue, 20 Aug 2019 11:03:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z11so11924849wrt.4
	for <dm-devel@redhat.com>; Tue, 20 Aug 2019 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PYetcWjVc7vdSwtXssMSvg418r+8X4MgNhcaW/l2Leo=;
	b=DOrFw9r0hM88VSDUNv4XPUF8FQuOn1Tbru5+f8U0usSQcwdLnstfltZSH0d8/CLFmW
	zsjrLaCUTr36kZ3ZqK7iCs5NCovMAMExkBSaVCCcnDZ3QhRD5ppm5x3py7r20aRfPYLQ
	zD8RCtM0hDkqSHJwbEFRadyQ4WaTLz80AjVBwFExy++q8x8CjfMjOsQ+aPd/at7qoUWL
	kfBIYyKoI+ZPDQySwrjXDAyNvt92RQqpin7+1JSxin+dPz0+H+aKxjit0PbmA5L05deo
	0XNn66WVCUU3GuTb203wcmJD2NwPmIZ/KCc5MVZZq/nOpQGwZ9m8GsFJtvEGpGD6/tth
	E7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PYetcWjVc7vdSwtXssMSvg418r+8X4MgNhcaW/l2Leo=;
	b=ndvOVjvW/84pC9hu4KXJvsuyPAY7bRfDbNh9ls+lkjCBO+HAxxjwAl8xybwgfDaFpk
	4F5fk2B0ocI03S3cRAXS4o9ePUvhe90N0B4n6jLhWNBwmMi5hqAUg7nyyWB7G9jHpqjB
	DPQLBmi7T/9wQczBMfGCHg+cVLTbY8J94g40UhBDy1SsZrStvJP0pxBVvjNRv8GbuMv2
	lvlRu1ig9Qar5Pt3MX2Dcc8230spRskvH8Bbhi5cdJbbl2HKIT67ZqTkXZ5+FTmoMTi8
	cZaYimQ6rYw2mYH4w2B43RDgj9B8sS5muAPX4y5v45Nw8o/Nx/0DO0jvdS2nBxe5FZ3H
	HvVg==
X-Gm-Message-State: APjAAAW9PjE5lN0gxs0S8xn4q2dCUxN1ZKZ6onFFvfAh/upJGZKDr478
	4lsDa88gAwWDaduqSll7zuCRyqj6PumD8HruiPugIQ==
X-Google-Smtp-Source: APXvYqzvZ8hgDgAwzcvz4UxyqiwEffyiB3lMMfCJYWOzWCNzFhIU5+8kaDYYixTIzGlFuczUg/+fNNI/HFx5ihOZ5AI=
X-Received: by 2002:a05:6000:128d:: with SMTP id
	f13mr959362wrx.241.1566298993670; 
	Tue, 20 Aug 2019 04:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
In-Reply-To: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 20 Aug 2019 14:03:02 +0300
Message-ID: <CAKv+Gu_ZoQ+mfchJMigoy32DtAMbzRU3fOZS4YjBMS-2ZMvebg@mail.gmail.com>
To: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 20 Aug 2019 11:03:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 20 Aug 2019 11:03:15 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v13 0/6] crypto: switch to crypto API for
	ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Tue, 20 Aug 2019 11:03:42 +0000 (UTC)

On Mon, 19 Aug 2019 at 17:17, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> This series creates an ESSIV template that produces a skcipher or AEAD
> transform based on a tuple of the form '<skcipher>,<shash>' (or '<aead>,<shash>'
> for the AEAD case). It exposes the encapsulated sync or async skcipher/aead by
> passing through all operations, while using the cipher/shash pair to transform
> the input IV into an ESSIV output IV.
>
> Changes since v12:
> - don't use a per-instance shash but only record the cra_driver_name of the
>   shash when instantiating the template, and allocate the shash for each
>   allocated transform instead
> - add back the dm-crypt patch -> as Milan has indicated, his preference would
>   be to queue these changes for v5.4 (with the first patch shared between the
>   cryptodev and md trees on a stable branch based on v5.3-rc1 - if needed,
>   I can provide a signed tag)
>

Actually, since Eric has indicated that he does not want to take the
associated fscrypt change for v5.4 anyway, patch #1 could simply be
routed through the md tree instead, while the others are taken through
cryptodev.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
