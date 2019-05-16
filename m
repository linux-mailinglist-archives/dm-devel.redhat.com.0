Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C3974210ED
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 01:06:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2E646308FBAC;
	Thu, 16 May 2019 23:06:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9F1F5D968;
	Thu, 16 May 2019 23:06:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 109D81806B12;
	Thu, 16 May 2019 23:06:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GN6Jj6032374 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 19:06:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8AD160DD7; Thu, 16 May 2019 23:06:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3ADA60DCF
	for <dm-devel@redhat.com>; Thu, 16 May 2019 23:06:17 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5DDAD104C1
	for <dm-devel@redhat.com>; Thu, 16 May 2019 23:06:16 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id h11so3238286ljb.2
	for <dm-devel@redhat.com>; Thu, 16 May 2019 16:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C6gmjJd7N5Nv8q9iz96Jdb1ylTkw3RMOCbKRe/2+VB8=;
	b=dxgqfs9fq2wqHK+mmo4PR9pjY/d1/hIFkR4vuEe2dGD68H7Lxiz4SeW18TGqrOEdQY
	ozZMj6Mlzb+cL2/EPgw9SpdZwXLyvMNijkm1AHy+m5NfiR/bY42dju8qX4mXfGxMHzEE
	DGd2CEi2T8RpC8XD5CJWIJUJqLtCmdrM2F6WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C6gmjJd7N5Nv8q9iz96Jdb1ylTkw3RMOCbKRe/2+VB8=;
	b=LOR0ClZwn9txdImhLY3yDe76E/uqDMAeDnh6wZ78C/3zQ4dUlfF2bcPHDV4iN8KKMM
	vM5WbxtBmbwUO+vxTf9VIf/u7CDYfjo2bQaDqM8crv9AX99hmeWuwThxvWFH0ZxiB+fB
	KSdPH1QDRg3wmY3ALHY+2NDIgvcLvpBsKl0loXTjPSN7Ro7bHb+6ilhefnNZsIrKi4bw
	9+kbhgMgwXgWW8VYnSdkwHI5t0KVUzpQmMfcM46jKWTHTKylh4zOZU//qE4e9FPSr1gu
	AnshlIhSjdbkXNEUFKlvQCy4N9NdUenUFpNPUX7HpQlxbIEY26nLZm2wdaMDktsazAY5
	7jrg==
X-Gm-Message-State: APjAAAWw7hNrnaIAfzh+4kG7d1Inb3vLnc7YN4gXLXtdI34gtknq/DPI
	aTV1HTLSSqsVvpGYDh3yrJY/j/prTxQ=
X-Google-Smtp-Source: APXvYqwerCQT65/Mn7vYspwAF3tzWVtSl2aoSpwBbyBvvHmzt5w2X+8GBuK28BPo367GTplIHgsazA==
X-Received: by 2002:a2e:98c1:: with SMTP id s1mr17305441ljj.68.1558047974556; 
	Thu, 16 May 2019 16:06:14 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com.
	[209.85.208.178])
	by smtp.gmail.com with ESMTPSA id n1sm1100450ljg.84.2019.05.16.16.06.14
	for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 16:06:14 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id j24so4635087ljg.1
	for <dm-devel@redhat.com>; Thu, 16 May 2019 16:06:14 -0700 (PDT)
X-Received: by 2002:a2e:9b0c:: with SMTP id u12mr3767139lji.189.1558047564003; 
	Thu, 16 May 2019 15:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190513185948.GA26710@redhat.com> <20190516143206.GA16368@lobo>
In-Reply-To: <20190516143206.GA16368@lobo>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 16 May 2019 15:59:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whepZ=ht0h-+XaQzag5eAVQtofDW_gUknwu+d+Cnh+yQw@mail.gmail.com>
Message-ID: <CAHk-=whepZ=ht0h-+XaQzag5eAVQtofDW_gUknwu+d+Cnh+yQw@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 16 May 2019 23:06:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 16 May 2019 23:06:16 +0000 (UTC) for IP:'209.85.208.182'
	DOMAIN:'mail-lj1-f182.google.com' HELO:'mail-lj1-f182.google.com'
	FROM:'torvalds@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.182 mail-lj1-f182.google.com 209.85.208.182
	mail-lj1-f182.google.com <torvalds@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
	Nikos Tsironis <ntsironis@arrikto.com>, Huaisheng Ye <yehs1@lenovo.com>,
	YueHaibing <yuehaibing@huawei.com>, Peng Wang <rocking@whu.edu.cn>,
	Helen Koike <helen.koike@collabora.com>, Martin Wilck <mwilck@suse.com>,
	linux-block <linux-block@vger.kernel.org>,
	Milan Broz <gmazyland@gmail.com>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Sheetal Singala <2396sheetal@gmail.com>,
	Colin Ian King <colin.king@canonical.com>,
	Yufen Yu <yuyufen@huawei.com>, Christoph Hellwig <hch@lst.de>,
	Alasdair G Kergon <agk@redhat.com>, Bryan Gurney <bgurney@redhat.com>
Subject: Re: [dm-devel] [git pull v2] device mapper changes for 5.2
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 16 May 2019 23:06:54 +0000 (UTC)

On Thu, May 16, 2019 at 7:32 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> Seems you haven't pulled my 'for-5.2/dm-changes' tag from earlier this
> week so I've added 4 additional simple commits to this v2 pull.

Hmm. Strange. I see your email from three days ago now that you
mention it, but I don't recall having ever seen it before.

I must have fat-fingered it when it came in, and it was marked as
"read" without having ever been seen. Possibly because I was traveling
for my daughter's graduation, and being on mobile.

Anyway, good that you re-sent, updates and all. Now pulled

                  Linus

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
