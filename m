Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E58BD4CE25
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 15:03:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DCA08112C;
	Thu, 20 Jun 2019 13:03:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F2485C1A1;
	Thu, 20 Jun 2019 13:03:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40D85149E1;
	Thu, 20 Jun 2019 13:03:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KD2T5i023101 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 09:02:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 55B0660477; Thu, 20 Jun 2019 13:02:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50F9E601A5
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:02:27 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82478A4540
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:02:16 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id w25so230945ioc.8
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZG8hEqbKe8+NeO2UU3Wo1+Qx5s8edmihncRtoEu3NsE=;
	b=MHTQMQVycFJCJ1pv4dvDM7CbdvxB6eMQ5eFLRBVsGLJPwPa9hppCUVqcneOWxT80KF
	jUe1M05/taAPwL1EJl0AnAGaG0KUbuYUTyWXis/WsdYyGp9eReDMAAK2U/GeHFsA5Rrr
	9VeWEtO5w18/7n5diW4KQIqXW1x48GXpihS2l8CkwMHl4QxJ3RwmM0bEPePNnbBTL+BI
	w2UMRGqFWkrOyc+6jnpUN5gy825JITBUPGdKC75EICXqMjMksL3U6Q/vj4N1U+WFFH1f
	PcEJxZZcsf5C0ad9umqyZjCFN+XMQN1JiXdijMWXEXkXihw+lfNQi02kqhJCExouBxFH
	liNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZG8hEqbKe8+NeO2UU3Wo1+Qx5s8edmihncRtoEu3NsE=;
	b=YKI+0RylHBRnMPElJgzqeVqIp2HvIB2ltvPXZlA7Yl/fV7MoKOS72zcCZfpl3ssM7H
	5RVEDc+nOzOQS3ZwRALO8nzt/dDoKgBhBWt4LteR6g7rzsbDqhmioHVde4Xn0KGm2wYt
	jfU4/iV6saE41dfWnKX66jdQ5944pnytZMPqqvBetv2C72QKhAT4ys2cCFR8MfNRl+be
	nY6wjwK+HvfbXmvc6+RU98HRdiI7p9Dpo/Z/tptw8iCY5gn8WuCg7ilWDhtHr04BUMG9
	JaZqO8BcS/+rfSu2gPD2RyJsnj1RhMVZKnn/qc2YYWdgAzc2V5uA7IWzcpCHWc3GUimV
	UYSQ==
X-Gm-Message-State: APjAAAUg1/opz/AFcLQSC/zf44i3KdRwHfEUriqlfOlb2Z/nlb7jOhMW
	B6t2x9leQbJ3cjrgCkL/dKTRtlPGl4a7Cybf/wZ5qA==
X-Google-Smtp-Source: APXvYqy2/J+ggwqeC5SCchrzOHDj4MwOttTaRmIM+xoZHARU21kDD/whmCPtQebvBvILJla6Mt768q+Wl8ajU6EQdQ0=
X-Received: by 2002:a5d:8794:: with SMTP id f20mr30229023ion.128.1561035735859;
	Thu, 20 Jun 2019 06:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
	<CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
	<20190620125339.gqup5623sw4xrsmi@gondor.apana.org.au>
In-Reply-To: <20190620125339.gqup5623sw4xrsmi@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 20 Jun 2019 15:02:04 +0200
Message-ID: <CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 20 Jun 2019 13:02:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 20 Jun 2019 13:02:16 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.19  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: linux-fscrypt@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 1/6] crypto: essiv - create wrapper
	template for ESSIV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 20 Jun 2019 13:03:36 +0000 (UTC)

On Thu, 20 Jun 2019 at 14:53, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jun 20, 2019 at 09:30:41AM +0200, Ard Biesheuvel wrote:
> >
> > Is this the right approach? Or are there better ways to convey this
> > information when instantiating the template?
> > Also, it seems to me that the dm-crypt and fscrypt layers would
> > require major surgery in order to take advantage of this.
>
> Oh and you don't have to make dm-crypt use it from the start.  That
> is, you can just make things simple by doing it one sector at a
> time in the dm-crypt code even though the underlying essiv code
> supports multiple sectors.
>
> Someone who cares about this is sure to come along and fix it later.
>

It also depend on how realistic it is that we will need to support
arbitrary sector sizes in the future. I mean, if we decide today that
essiv() uses an implicit sector size of 4k, we can always add
essiv64k() later, rather than adding lots of complexity now that we
are never going to use. Note that ESSIV is already more or less
deprecated, so there is really no point in inventing these weird and
wonderful things if we want people to move to XTS and plain IV
generation instead.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
