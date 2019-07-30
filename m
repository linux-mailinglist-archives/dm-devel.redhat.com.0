Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81B7B56A
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 00:01:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB29F59465;
	Tue, 30 Jul 2019 22:01:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D71A60A9F;
	Tue, 30 Jul 2019 22:01:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3F0B1800202;
	Tue, 30 Jul 2019 22:01:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UM16ea025011 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 18:01:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16F1419728; Tue, 30 Jul 2019 22:01:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 667E719724;
	Tue, 30 Jul 2019 22:01:03 +0000 (UTC)
Date: Tue, 30 Jul 2019 18:01:02 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190730220102.GA15604@redhat.com>
References: <20190730113708.14660-1-pagupta@redhat.com>
	<2030283543.5419072.1564486701158.JavaMail.zimbra@redhat.com>
	<20190730190737.GA14873@redhat.com>
	<CAPcyv4i10K3QdSwa3EF9t8pS-QrB9YcBEMy49N1PnYQzCkBJCw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4i10K3QdSwa3EF9t8pS-QrB9YcBEMy49N1PnYQzCkBJCw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Pankaj Gupta <pagupta@redhat.com>, jencce.kernel@gmail.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm: fix dax_dev NULL dereference
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 30 Jul 2019 22:01:22 +0000 (UTC)

On Tue, Jul 30 2019 at  5:38pm -0400,
Dan Williams <dan.j.williams@intel.com> wrote:

> On Tue, Jul 30, 2019 at 12:07 PM Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > I staged the fix (which I tweaked) here:
> > https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.3&id=95b9ebb78c4c733f8912a195fbd0bc19960e726e
> 
> Thanks for picking this up Mike, but I'd prefer to just teach
> dax_synchronous() to return false if the passed in dax_dev is NULL.
> Thoughts?

I considered that too but I moved away from it because I'm so used to
the various block interfaces requiring the caller pass a non-NULL
pointer (e.g. request_queue):

$ grep -ri return drivers/md/dm-table.c | grep \&\&
drivers/md/dm-table.c:        return dev->dax_dev && dax_synchronous(dev->dax_dev);
drivers/md/dm-table.c:        return q && blk_queue_zoned_model(q) == *zoned_model;
drivers/md/dm-table.c:        return q && blk_queue_zone_sectors(q) == *zone_sectors;
drivers/md/dm-table.c:        return q && (q->queue_flags & flush);
drivers/md/dm-table.c:        return q && blk_queue_nonrot(q);
drivers/md/dm-table.c:        return q && !blk_queue_add_random(q);
drivers/md/dm-table.c:        return q && !q->limits.max_write_same_sectors;
drivers/md/dm-table.c:        return q && !q->limits.max_write_zeroes_sectors;
drivers/md/dm-table.c:        return q && !blk_queue_discard(q);
drivers/md/dm-table.c:        return q && !blk_queue_secure_erase(q);
drivers/md/dm-table.c:        return q && bdi_cap_stable_pages_required(q->backing_dev_info);

I'm fine with however you'd like to skin this cat though.

Just let me know and I'll keep/drop this patch accordingly.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
