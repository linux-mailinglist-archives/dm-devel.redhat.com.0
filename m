Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5A541D29
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 09:04:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 853D689AD0;
	Wed, 12 Jun 2019 07:03:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 305BA5C231;
	Wed, 12 Jun 2019 07:03:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27AF81806B16;
	Wed, 12 Jun 2019 07:03:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C71pVw007480 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 03:01:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BD4E86B8E6; Wed, 12 Jun 2019 07:01:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E6964046;
	Wed, 12 Jun 2019 07:01:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95C173086229;
	Wed, 12 Jun 2019 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U7CBgI/BlOH8mCpak6QJYkxnxyBdoEy/BPSE3vs157A=;
	b=Bzb3btvII+xO775JFm+/k4qqn
	eHS/t3brEGYdMoJtVpIGT5EN2xaM3k7I71ALJsbbc+0vNmy8E6uGvgXyQb2ZqWuEQyPxy2lL/TD3s
	uMzXPuNdC+uyOv3QLqxtZjr8Jjdtu3o3eUUIx3Odo483jPATMKUouu0blV4M0xTAkF80OunW1Z7jF
	LBBOFvv+p2bswnZmudxhQwgVJUYeAJZYogoM/0PEtY6Al28wR3Z4Vx7kZQiirCPrJws0g+8seZO/f
	e7jBGxpuGd5dCTGNxlOOHGOrTTq6GAsoeq9Y0FUPBC8IR1BqktaTs9S5schf5x3nbgz3iU4CAiqDE
	YCgQ3nYWA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1haxFu-0005GR-Tc; Wed, 12 Jun 2019 07:01:10 +0000
Date: Wed, 12 Jun 2019 00:01:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Dorminy <jdorminy@redhat.com>
Message-ID: <20190612070110.GA11707@infradead.org>
References: <70cda2a3-f246-d45b-f600-1f9d15ba22ff@gmail.com>
	<87eflmpqkb.fsf@notabene.neil.brown.name>
	<20190222211006.GA10987@redhat.com>
	<7f0aeb7b-fdaa-0625-f785-05c342047550@kernel.dk>
	<20190222235459.GA11726@redhat.com>
	<CAMeeMh-2ANOr_Sb66EyA_HULkVRudD7fyOZsDbpRpDrshwnR2w@mail.gmail.com>
	<20190223024402.GA12407@redhat.com>
	<CAMeeMh9qLkTByWJewPR4o844wPkA-g5Hnm7aGjszuPopPAe8vA@mail.gmail.com>
	<CAMeeMh-6KMLgriX_7KT52ynjBMyT9yDWSMKv6YXW+yDpvv0=wA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMeeMh-6KMLgriX_7KT52ynjBMyT9yDWSMKv6YXW+yDpvv0=wA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Wed, 12 Jun 2019 07:01:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 12 Jun 2019 07:01:28 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+eeb336ffa9092f1fc134+5771+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+eeb336ffa9092f1fc134+5771+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	NeilBrown <neilb@suse.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 12 Jun 2019 07:04:23 +0000 (UTC)

On Tue, Jun 11, 2019 at 10:56:42PM -0400, John Dorminy wrote:
> I believe the second of these might, but is not guaranteed to,
> preserve the first error observed in a child; I believe if you want to
> definitely save the first error you need an atomic.

Is there any reason not to simply use a cmpxchg?  Yes, it is a
relatively expensive operation, but once we are chaining bios we are out
of the super hot path anyway.  We do something similar in xfs and iomap
already.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
