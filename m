Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC629AF99
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70AE07BDA7;
	Fri, 23 Aug 2019 12:35:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 050F6100EBD4;
	Fri, 23 Aug 2019 12:35:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6912024F30;
	Fri, 23 Aug 2019 12:35:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7N2ZXAC014206 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 22:35:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC4DA1001959; Fri, 23 Aug 2019 02:35:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D65721001947
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 02:35:31 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A09652BFDD
	for <dm-devel@redhat.com>; Fri, 23 Aug 2019 02:35:28 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id l7so16632074ioj.6
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 19:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Ob+A4xxX2bRSxLGz92/UzTEvC1yWM8JcjhiXKDPfB8=;
	b=flcLM5FZxA1UdTl+5MfostzBYwQfyv1yb87DaSzrnDrUwd/ZNj4K4T/rHszC/sFQMH
	ADUFV/N/N6vulg+PsFB9LiJOba7WYzMsXqe7TkwmxiwQw++HUI5Q9lwxgsadqj5kp36o
	7ir9Ftxz3Frpzbh7dbD9IWl/fAPy+uyEwFD9Qu0xwImVT/66UuNo3m+3vDu9rqcZdHGP
	dJuOAFAhp3e0iD0AWnqz3VAQtqcjnUDCLFkZZiPVDrJq83kU9d3bg+KlteAnZK+XFKE6
	M2BK3WAwQy2tydaBr0xJ2dcLV8QJVxM3CxkgnlBsNXoibdFYaWIIutqUzeXdd2gExoTy
	FEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Ob+A4xxX2bRSxLGz92/UzTEvC1yWM8JcjhiXKDPfB8=;
	b=rdKra9Iv9nRAVc2povfo9x27AaJIoIAt782FHJ4p7AxSpbGfVrHW1pGClCRkRn5CLj
	Atty0Ot8cv9WwOdFg32Sj+Kl3q61dg1Yv+YJI9mcJ5fJFmM1oHJG6WfJjqubSYdpX026
	urEDU7N7SPKoYas9ez13ABF6qhNdHUjT5AjKtVtHxTJeloJQ/Ptk1aoh5OpBGW+EM53a
	eKUn/A7dm4jeCgSu4zKpPbV0uKA3LshUen3BGjSHPzR7uaNHjuvqU8Of6sOlqbpPhrcn
	wbcPM29Ueav8+86aO8RD72Qs0G/CjOlodPqsgRNbajV5PJesGftVyuhfuzn5LTT240rn
	iTzg==
X-Gm-Message-State: APjAAAWkpBcEF++lsd4pW3C9kyF/zEGvK2qTepXZ944QZJcpKjYnngFH
	Zmhz1uPM6T7UBAYxhRhrQcZ/wHeX6M6g749WKm0g7w==
X-Google-Smtp-Source: APXvYqxk0KBtXTDXCH7sq1BDWGn2tzcj3BOrK9VJXXJYjin28Niwi8IhH6bIWJT+jY7Hn20R6XsnRrLk/vFE/AUzyqo=
X-Received: by 2002:a6b:c581:: with SMTP id v123mr3719443iof.158.1566527727590;
	Thu, 22 Aug 2019 19:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190821064226epcas2p2835b8a9084988b79107e54abfc5e7dab@epcas2p2.samsung.com>
	<004101d557eb$98b00060$ca100120$@samsung.com>
	<6ea5e5db-4dd4-719f-3b3e-b89099636ea6@kernel.dk>
In-Reply-To: <6ea5e5db-4dd4-719f-3b3e-b89099636ea6@kernel.dk>
From: Satya Tangirala <satyat@google.com>
Date: Thu, 22 Aug 2019 19:35:16 -0700
Message-ID: <CAA+FYZc6G0xk7Dhx0b9xNRoK+b+DpfuS+OK4wn4bpKpFPiiGUQ@mail.gmail.com>
To: Jens Axboe <axboe@kernel.dk>, boojin.kim@samsung.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 23 Aug 2019 02:35:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 23 Aug 2019 02:35:28 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'satyat@google.com' RCPT:''
X-RedHat-Spam-Score: -15.601  (DKIMWL_WL_MED, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, ENV_AND_HDR_SPF_MATCH, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE, SPF_PASS, USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <satyat@google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 23 Aug 2019 08:34:47 -0400
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
	Alasdair Kergon <agk@redhat.com>, Jaehoon Chung <jh80.chung@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	Kukjin Kim <kgene@kernel.org>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	"Theodore Y. Ts'o" <tytso@mit.edu>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [dm-devel] [PATCH 5/9] block: support diskcipher
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 23 Aug 2019 12:35:13 +0000 (UTC)

On Wed, Aug 21, 2019 at 5:10 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> On 8/21/19 12:42 AM, boojin.kim wrote:
> > This patch supports crypto information to be maintained via BIO
> > and passed to the storage driver.
> >
> > To do this, 'bi_aux_private', 'REQ_CYPTE' and 'bi_dun' are added
> > to the block layer.
> >
> > 'bi_aux_private' is added for loading additional private information into
> > BIO.
> > 'REQ_CRYPT' is added to distinguish that bi_aux_private is being used
> > for diskcipher.
> > F2FS among encryption users uses DUN(device unit number) as
> > the IV(initial vector) for cryptographic operations.
> > DUN is stored in 'bi_dun' of bi_iter as a specific value for each BIO.
> >
> > Before attempting to merge the two BIOs, the operation is also added to
> > verify that the crypto information contained in two BIOs is consistent.
>
> This isn't going to happen. With this, and the inline encryption
> proposed by Google, we'll bloat the bio even more. At least the Google
> approach didn't include bio iter changes as well.
>
> Please work it out between yourselves so we can have a single, clean
> abstraction that works for both.
>
> --
> Jens Axboe
>

Hi Boojin,

We're very keen to make sure that our approach to inline encryption can
work with diverse hardware, including Samsung's FMP hardware; if you
can see any issues with using our approach with your hardware please
let us know.

We understand that a possible concern for getting FMP working with our
patch series for Inline Encryption Support at

https://lore.kernel.org/linux-block/20190821075714.65140-1-satyat@google.com/

is that unlike some inline encryption hardware (and also unlike the JEDEC
UFS v2.1 spec), FMP doesn't have the concept of a limited number of
keyslots - to address that difference we have a "passthrough keyslot
manager", which we put up on top of our patch series for inline encryption
support at

https://android-review.googlesource.com/c/kernel/common/+/980137/2

Setting up a passthrough keyslot manager in the request queue of a
device allows the device to receive a bio's encryption context as-is with
the bio, which is what FMP would prefer. Are there any issues with
using the passthrough keyslot manager for FMP?

Thanks!
Satya

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
