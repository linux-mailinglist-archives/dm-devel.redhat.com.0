Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59C291EF
	for <lists+dm-devel@lfdr.de>; Fri, 24 May 2019 09:42:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88CD4307D851;
	Fri, 24 May 2019 07:41:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF7D1179F8;
	Fri, 24 May 2019 07:40:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F8EB1833001;
	Fri, 24 May 2019 07:40:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4NKVxYM030190 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 May 2019 16:32:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCCC45C219; Thu, 23 May 2019 20:31:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D84A25C69A
	for <dm-devel@redhat.com>; Thu, 23 May 2019 20:31:57 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 995FA30BDE49
	for <dm-devel@redhat.com>; Thu, 23 May 2019 20:31:30 +0000 (UTC)
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <guilherme.piccoli@canonical.com>) id 1hTuN6-0007w5-Ql
	for dm-devel@redhat.com; Thu, 23 May 2019 20:31:28 +0000
Received: by mail-wr1-f71.google.com with SMTP id r7so3372837wrn.8
	for <dm-devel@redhat.com>; Thu, 23 May 2019 13:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0dW+h03iOHL9hXzrG72krYhdVbEtg0vyFtbtFz1jJYI=;
	b=ZmjZXqToEb5bshbzzpqdEoB0Rl1k1/GLCqFTSLM2eP6YCeYh5MAr4zmgovyAY40imB
	FAG089ZpKQJpTwGaxSeTexVcAOcX+/XyJcw4yDwq9914KEHceGqixumiXYu5Z4Q/X36q
	8HIh3mdLYfe+YLNmg916Ap0s5bg5GlKUhrLvAnv1+jWZIuoVA5fGhkR1CHl5oB71NZ11
	Ok6sU+jpZjLzArY2jGDm8uAJhaQobC7tLtI2jMNgvmv9D1wPnDRvhi9AdXMmbeRqT+hd
	E/ktGI1gSt2ZSBUknV5mNpRqNWM75YQnLln3GkpoJa4ls56pr7V4RSlmbbVIDV28iGet
	7q8A==
X-Gm-Message-State: APjAAAVb3Uir/eSFBJGDap2/3zDYsALA0t06IEs5OZMYTmPs3xYRx6Zd
	Sl44cTb+0kfjLwDWWfvEzLxULFObzPLXUME8JgZMKfy/miJj8BecaGKi5d3dS7nY0vjxTSMgaWi
	fBoCgRaaBRXRkBSv1PYNWeUJRlvx06z/VMdlCOeiLTVswOw==
X-Received: by 2002:a1c:7d8e:: with SMTP id
	y136mr12828716wmc.129.1558643488518; 
	Thu, 23 May 2019 13:31:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzZrVtJmlEUBWpf3yRAcENU+Y5IToKvqA0uAnb6p0nV/TUnSml7P2OrLKKphRhi6bSed9/gBVCt8Ff7XZ2eEU=
X-Received: by 2002:a1c:7d8e:: with SMTP id
	y136mr12828709wmc.129.1558643488390; 
	Thu, 23 May 2019 13:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190520220911.25192-1-gpiccoli@canonical.com>
	<CAPhsuW6KayaNR-0eFHpvPG-LVuPFL_1OFjvZpOcnapVFe2vC9Q@mail.gmail.com>
	<3e583b2d-742a-3238-69ed-7a2e6cce417b@canonical.com>
	<CAPhsuW7o9bj5DYnUDkCqDeW7NnfNTSBBWJC5_ZVxhoomDEEJcg@mail.gmail.com>
In-Reply-To: <CAPhsuW7o9bj5DYnUDkCqDeW7NnfNTSBBWJC5_ZVxhoomDEEJcg@mail.gmail.com>
From: Guilherme Piccoli <gpiccoli@canonical.com>
Date: Thu, 23 May 2019 17:30:52 -0300
Message-ID: <CAHD1Q_zCkmiDN24Njjr5Nfuc11hSxN5fgw98MX9j5LJoiwgXPA@mail.gmail.com>
To: Song Liu <liu.song.a23@gmail.com>
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Thu, 23 May 2019 20:31:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 23 May 2019 20:31:36 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com' HELO:'youngberry.canonical.com'
	FROM:'guilherme.piccoli@canonical.com' RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com
	<guilherme.piccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 24 May 2019 03:36:06 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Christoph Hellwig <hch@infradead.org>,
	"Guilherme G. Piccoli" <kernel@gpiccoli.net>,
	stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Eric Ren <renzhengeek@gmail.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH V2 1/2] block: Fix a NULL pointer dereference
	in generic_make_request()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 24 May 2019 07:42:02 +0000 (UTC)

On Thu, May 23, 2019 at 2:06 PM Song Liu <liu.song.a23@gmail.com> wrote:
>
>
> Sorry for the confusion and delay. I will send patches to stable@.
>
> Song


Hi Song, no problem at all! Thanks a lot for the clarification.
Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
