Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CC841A8B
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 04:59:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45DA03082208;
	Wed, 12 Jun 2019 02:59:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA49E60F94;
	Wed, 12 Jun 2019 02:58:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B984624B25;
	Wed, 12 Jun 2019 02:58:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C2uwKG030426 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 22:56:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10B9E69195; Wed, 12 Jun 2019 02:56:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09ED369193
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 02:56:55 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E90537E8E
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 02:56:55 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id g14so13495915qta.12
	for <dm-devel@redhat.com>; Tue, 11 Jun 2019 19:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q1Qi48oLh9iihq2LkIgrDslGg/Vx8JGXFp2UzVtaaTY=;
	b=tL90p8QROqxpHOWyubMuV69PLPZV6T6typI3gKRacU0r0U/LWuNzzK2U3Pm7ff41p8
	ep7csVu6/YhFzJP/m7Yyw9QmDqsLH+VSVJANSYZGaqjOZqR/2AsQDoIzvEap5A2mqGzu
	LFWoPclgcfJF2PI0pJSDnjyeIp4/28Gr1eP8p4u6qzM3Ytw9VU6a5TGHZdGrgUFSRCNN
	zsBPUe9tuKa16TAQhD5ZgfkMN0jyGkiwBuG5956lpZpNvYoJWXijq3w7Np9k4geyEzPi
	ru1YY+oBCiAqxR89JK9wD+VRvfDxsvvNAzpfvHi/KKYZqGV+qGYZKnzeFux0Nh16Os13
	Biew==
X-Gm-Message-State: APjAAAUwVr9W8hohCQUNQ/8wSAxmpyR6ZmPdXBsIsC4IFFoz1RSqJL+m
	Bxo8Xajm+fQTYef6HiGe8Z8+7tZSU/R01KaoD5D3S38NH/1r3GYN7eWNFXxHbCafrkW2Aup7aP0
	6J426o9a1KgG9GWHBoZ/1AYqZivoZXwM=
X-Received: by 2002:a37:6708:: with SMTP id b8mr61258517qkc.141.1560308214915; 
	Tue, 11 Jun 2019 19:56:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxctTUcbUUwKEwCDb+kAVsNlcPeMauTITiiVl5q4wHU5Gq3T5KxTJd5OAfYva1ulpddSUg3/ykgbXPYx9uR294=
X-Received: by 2002:a37:6708:: with SMTP id b8mr61258505qkc.141.1560308214695; 
	Tue, 11 Jun 2019 19:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <70cda2a3-f246-d45b-f600-1f9d15ba22ff@gmail.com>
	<87eflmpqkb.fsf@notabene.neil.brown.name>
	<20190222211006.GA10987@redhat.com>
	<7f0aeb7b-fdaa-0625-f785-05c342047550@kernel.dk>
	<20190222235459.GA11726@redhat.com>
	<CAMeeMh-2ANOr_Sb66EyA_HULkVRudD7fyOZsDbpRpDrshwnR2w@mail.gmail.com>
	<20190223024402.GA12407@redhat.com>
	<CAMeeMh9qLkTByWJewPR4o844wPkA-g5Hnm7aGjszuPopPAe8vA@mail.gmail.com>
In-Reply-To: <CAMeeMh9qLkTByWJewPR4o844wPkA-g5Hnm7aGjszuPopPAe8vA@mail.gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Tue, 11 Jun 2019 22:56:42 -0400
Message-ID: <CAMeeMh-6KMLgriX_7KT52ynjBMyT9yDWSMKv6YXW+yDpvv0=wA@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, NeilBrown <neilb@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block@vger.kernel.org,
	device-mapper development <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] block: be more careful about status in
	__bio_chain_endio
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 12 Jun 2019 02:59:42 +0000 (UTC)

Having studied the code in question more thoroughly, my first email's
scenario can't occur, I believe. bio_put() contains a
atomic_dec_and_test(), which (according to
Documentation/atomic_t.txt), having a return value, are fully ordered
and therefore impose a general memory barrier. A general memory
barrier means that no value set before bio_put() may be observed
afterwards, if I accurately understand
Documentation/memory_barriers.txt. Thus, the scenario I imagined, with
a load from inside __bio_chain_endio() being visible in bi_end_io(),
cannot occur.

However, the second email's scenario, of a compiler making two stores
out of a conditional store, is still accurate according to my
understanding. I continue to believe setting parent->bi_status needs
to be a WRITE_ONCE() and any reading of parent->bi_status before
bio_put() needs to be at least a READ_ONCE(). The last thing in that
email is wrong for the same reason that the first email couldn't
happen: the bio_put() general barrier means later accesses to the
field from a single thread will freshly read the field and thereby not
get an incorrectly cached value.

As a concrete proposal, I believe either of the following work and fix
the race NeilB described, as well as the compiler (or CPU) race I
described:

 -     if (!parent->bi_status)
 -               parent->bi_status = bio->bi_status;
 +     if (bio->bi_status)
 +               WRITE_ONCE(parent->bi_status, bio->bi_status);

--or--

 -     if (!parent->bi_status)
 -               parent->bi_status = bio->bi_status;
 +     if (!READ_ONCE(parent->bi_status) && bio->bi_status)
 +               WRITE_ONCE(parent->bi_status, bio->bi_status);

I believe the second of these might, but is not guaranteed to,
preserve the first error observed in a child; I believe if you want to
definitely save the first error you need an atomic.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
