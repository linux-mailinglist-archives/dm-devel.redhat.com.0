Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 63024A7385
	for <lists+dm-devel@lfdr.de>; Tue,  3 Sep 2019 21:17:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2ACE3315C004;
	Tue,  3 Sep 2019 19:17:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A2D75D6B2;
	Tue,  3 Sep 2019 19:17:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BC132551C;
	Tue,  3 Sep 2019 19:17:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83JGtD0024147 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 15:16:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 091855C298; Tue,  3 Sep 2019 19:16:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0441F5C231
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 19:16:51 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F4CB8CF1A3
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 19:16:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c3so18658359wrd.7
	for <dm-devel@redhat.com>; Tue, 03 Sep 2019 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gBst/PzcKHazEBTzFOINHVe/fZC6+oHesCadX7XbBW0=;
	b=QPF2NDhYwyppH6Ky42ZPl3wJNJ0hG3VrH/qMWKJNT7kXCTnpRDLUfCVs1QYDGM5eaI
	46oNdYPrKSnwq3Ju/RtVX4uw+8ZgLxmEoj6+V78IsZx4exsmD27Iu2xF3zZberjXTVw2
	vL2KikBY1kzZzgt1J0zx0PKDw8/oP/CwwCKvmnzL/0cxt9x2XYP1TeprVhmSycNd4oi9
	bMooHOJTblHagb7LIY7ZaPQAX7yHJKqXJcvUGYtHQpqtQxoNpLkw/TYGZ5spqbsheTBs
	y5HsHbeJOdMN7+b7bzuMSUg1l4qCURo2ACak2V1hnoFeeAOBTdoWzcPni02eATquQePb
	ljfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gBst/PzcKHazEBTzFOINHVe/fZC6+oHesCadX7XbBW0=;
	b=lS/l3drm386v5sC8sj3Y4qf86Az7bFAPb8AYlNttynMeuAebGFSyKZ3uCHHlj7dJBf
	CzRFuU/UobbAjSXBOuMFVMHtAJYxSXe0WH43RlTMuVrDtYKhCmrgtnmg8l1M2XuAO1Dy
	/MAwfivooXoOTmxz8EiCPiSePpIYEnzWAU/s4MJVfHQw4sSx6Z1hBJLxYccp3IeZnzyc
	eGa05UsDQht6vgXjNunFmPwwMhNHpW2wIQHbJ4FRZMkyQJ+WpQTiwL+EbvKYva9gejju
	YVCCBt6Nc4gOoK3Zr4pOfF0DdKZ/Gri+LtqXK8TfTzdgjg9hwBnxHhzYEa9cIMgEVoMC
	Cscw==
X-Gm-Message-State: APjAAAXA/PhYeBmsTlDfhESdljkVBzMs/KfgHdktJqdJCLPS4KfY5KRs
	Cj0fO/GakjqnerpOTCU4CSHmH9RW9tyEEX65hs0vCg==
X-Google-Smtp-Source: APXvYqwpxhf+Qoc7sEiMbRBgC/7oVqCEsQjJITxxASlLOngz3EaN5uDzkvXJq3beLubl4iXw3k2o/reTbxu92Zi6LBc=
X-Received: by 2002:adf:9e09:: with SMTP id u9mr45284225wre.169.1567538208948; 
	Tue, 03 Sep 2019 12:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
	<20190819141738.1231-6-ard.biesheuvel@linaro.org>
	<20190903185537.GC13472@redhat.com>
In-Reply-To: <20190903185537.GC13472@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 3 Sep 2019 12:16:37 -0700
Message-ID: <CAKv+Gu8wr3HnP7uVDAOY=o54dWVkPoWm5V43LU_QNVMK_Cc2GA@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.69]);
	Tue, 03 Sep 2019 19:16:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Tue, 03 Sep 2019 19:16:50 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	device-mapper development <dm-devel@redhat.com>,
	Gilad Ben-Yossef <gilad@benyossef.com>, linux-fscrypt@vger.kernel.org,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v13 5/6] md: dm-crypt: switch to ESSIV crypto
	API template
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 03 Sep 2019 19:17:11 +0000 (UTC)

On Tue, 3 Sep 2019 at 11:55, Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Mon, Aug 19 2019 at 10:17am -0400,
> Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> > Replace the explicit ESSIV handling in the dm-crypt driver with calls
> > into the crypto API, which now possesses the capability to perform
> > this processing within the crypto subsystem.
> >
> > Note that we reorder the AEAD cipher_api string parsing with the TFM
> > instantiation: this is needed because cipher_api is mangled by the
> > ESSIV handling, and throws off the parsing of "authenc(" otherwise.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> I really like to see this type of factoring out to the crypto API;
> nicely done.
>
> Acked-by: Mike Snitzer <snitzer@redhat.com>
>
> Herbert, please feel free to pull this, and the next 6/6 patch, into
> your crypto tree for 5.4.  I see no need to complicate matters by me
> having to rebase my dm-5.4 branch ontop of the crypto tree, etc.
>

Thanks Mike.

There is no need to rebase your branch - there is only a single
dependency, which is the essiv template itself, and the patch that
adds that (#1 in this series) was acked by Herbert, specifically so
that it can be taken via another tree. The crypto tree has no
interdependencies with this template, and the other patches in this
series are not required for essiv in dm-crypt.

If you feel it is too late in the cycle, we can defer to v5.5, but in
this case, we should align with Eric, which will depend on the essiv
template for fscrypt as well.

In any case, it is up to you, Eric and Herbert to align on this. For
me, it doesn't really matter whether this lands in v5.4 or v5.5. There
is some followup work based on this, but that is further out still.

Thanks,
Ard.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
