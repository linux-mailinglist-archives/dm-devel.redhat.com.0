Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21F47E56
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 11:25:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E40634CF;
	Mon, 17 Jun 2019 09:25:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 460F69F2E8;
	Mon, 17 Jun 2019 09:25:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6C311806B12;
	Mon, 17 Jun 2019 09:25:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5H9Otum032588 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 05:24:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94D8954586; Mon, 17 Jun 2019 09:24:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F03822710
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 09:24:53 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDA793086222
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 09:24:42 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id w25so19578706ioc.8
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zIqikUxxUkznt/nPhZHSPquXqmCjr0iAh/jFh9d8P3A=;
	b=fLsvWmEGUkcftWJR9NozAsTm7Mo72HiPUuzSfhlKYGihIuydPz99+gbl4pOBPFGByl
	5CIEpGGJJQNDSYPn0PzRtpPQdNDaJidhuYmvMJ/qGYxqEfY75Ezgbf7dY+eDXGIi/ZT4
	j1+zcJYVZnCg87OeiZ34VLfHtpO9w63q8EK1sfhoSH9VoZD7yjbChUCDRgZsvl0hhxVX
	8mVAzAd/n8cw3ugcUssXJybA9+gInlaL9G+E1+j7TXyz0lAyz/+7aiTCD/vvXBZw9zl1
	bw8N6Y2lGCJ2qPBrnrH3K52Sdi6Jl3gZsF5b80N2DmKrM8/CWHDEk6w4hYqV2GgZPAOG
	KzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zIqikUxxUkznt/nPhZHSPquXqmCjr0iAh/jFh9d8P3A=;
	b=PwRFmfb3RvXSIh/+SiEUfIeLlN4go3ZH+eCc/tNq+y7mas/VN8UAO7dEujy1ohLJlH
	RC1ziBEcQfPIguDFzGsu24gA9To/+FBSg14CPulVJK8+IUbo8edIrBggpEAScSuo1kxM
	oe9MQfrxrX07e6xCxy4zXHJnWU68y7PX/PtnJEHoFISd0xDG4UIkmoPbsAQlJ0UXUSiE
	8Xkv8s56QNbR5qhWBBglWaFhmSIz174facDjMC/dXwd//7T4UfRK24z7PdXHH1JcdyLe
	8FuJOPdG1Rlf/d6ZwzEjg/c7vFEQgewmB0lYdm5LMMoQkKYZhAIJjlvszvnmMiBGsT2U
	kEHA==
X-Gm-Message-State: APjAAAVLXdhgrzWSlN+zq4PkJQoSYB37ym/v6bu9MG3U37abbfBysz67
	cbktG1i4gau8B0eaI/8TYSgPeefrq82R97OJqEs7DgrVUIg=
X-Google-Smtp-Source: APXvYqxU96w28abtHE8iCpMU+y7SrZIpL//Bw34gn+u4ZU8wsAw3pX+V1uOspSgWJpQNL5A2E/SEDtf0TJoK9q0SimM=
X-Received: by 2002:a5d:9456:: with SMTP id x22mr868694ior.71.1560763482317;
	Mon, 17 Jun 2019 02:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<20190617092012.gk7wrazxh7bwfmjk@gondor.apana.org.au>
In-Reply-To: <20190617092012.gk7wrazxh7bwfmjk@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 17 Jun 2019 11:24:31 +0200
Message-ID: <CAKv+Gu_34nOAcTBJPi7cR2W7w-1c27ofgoDaXZtuZh8qaaQJSQ@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 17 Jun 2019 09:24:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 17 Jun 2019 09:24:43 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.108  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 17 Jun 2019 09:25:34 +0000 (UTC)

On Mon, 17 Jun 2019 at 11:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Mon, Jun 17, 2019 at 11:15:01AM +0200, Ard Biesheuvel wrote:
> >
> > Ah yes, thanks for reminding me. There was some debate in the past
> > about this, but I don't remember the details.
>
> I think there were some controversy regarding whether the resulting
> code lived in drivers/md or crypto.  I think as long as drivers/md
> is the only user of the said code then having it in drivers/md should
> be fine.
>
> However, if we end up using/reusing the same code for others such as
> fs/crypto then it might make more sense to have them in crypto.
>

Agreed. We could more easily test it in isolation and ensure parity
between different implementations, especially now that we have Eric's
improved testing framework that tests against generic implementations.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
