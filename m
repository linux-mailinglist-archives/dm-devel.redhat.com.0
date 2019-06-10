Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B438C3AFF6
	for <lists+dm-devel@lfdr.de>; Mon, 10 Jun 2019 09:51:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDA713082E63;
	Mon, 10 Jun 2019 07:50:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9050760856;
	Mon, 10 Jun 2019 07:50:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3A7D206D6;
	Mon, 10 Jun 2019 07:50:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5A58aRf026057 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Jun 2019 01:08:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F22D65B685; Mon, 10 Jun 2019 05:08:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E477A5B681;
	Mon, 10 Jun 2019 05:08:22 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D91C206D1;
	Mon, 10 Jun 2019 05:08:21 +0000 (UTC)
Date: Mon, 10 Jun 2019 01:08:20 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <1533125860.33764157.1560143300908.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAPcyv4iW-UeHBs+qSii2Pk7Q2Nki6imGBTEORuxEAWgEMMp=nA@mail.gmail.com>
References: <20190521133713.31653-1-pagupta@redhat.com>
	<20190521133713.31653-5-pagupta@redhat.com>
	<CAPcyv4iW-UeHBs+qSii2Pk7Q2Nki6imGBTEORuxEAWgEMMp=nA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.116.16, 10.4.195.3]
Thread-Topic: enable synchronous dax
Thread-Index: bfiNCXycvh8K7TR5aXllhHNvtwio0w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 10 Jun 2019 03:48:48 -0400
Cc: cohuck@redhat.com, Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, david <david@fromorbit.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	virtualization@lists.linux-foundation.org,
	device-mapper development <dm-devel@redhat.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Ross Zwisler <zwisler@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
	Dave Jiang <dave.jiang@intel.com>, jstaron@google.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, Adam Borowski <kilobyte@angband.pl>,
	Randy Dunlap <rdunlap@infradead.org>, Rik van Riel <riel@surriel.com>,
	yuval shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, lcapitulino@redhat.com,
	Kevin Wolf <kwolf@redhat.com>, Nitesh Narayan Lal <nilal@redhat.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [dm-devel] [PATCH v10 4/7] dm: enable synchronous dax
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 10 Jun 2019 07:51:06 +0000 (UTC)


> On Tue, May 21, 2019 at 6:43 AM Pankaj Gupta <pagupta@redhat.com> wrote:
> >
> >  This patch sets dax device 'DAXDEV_SYNC' flag if all the target
> >  devices of device mapper support synchrononous DAX. If device
> >  mapper consists of both synchronous and asynchronous dax devices,
> >  we don't set 'DAXDEV_SYNC' flag.
> >
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > ---
> >  drivers/md/dm-table.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> > index cde3b49b2a91..1cce626ff576 100644
> > --- a/drivers/md/dm-table.c
> > +++ b/drivers/md/dm-table.c
> > @@ -886,10 +886,17 @@ static int device_supports_dax(struct dm_target *ti,
> > struct dm_dev *dev,
> >         return bdev_dax_supported(dev->bdev, PAGE_SIZE);
> >  }
> >
> > +static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
> > +                              sector_t start, sector_t len, void *data)
> > +{
> > +       return dax_synchronous(dev->dax_dev);
> > +}
> > +
> >  static bool dm_table_supports_dax(struct dm_table *t)
> >  {
> >         struct dm_target *ti;
> >         unsigned i;
> > +       bool dax_sync = true;
> >
> >         /* Ensure that all targets support DAX. */
> >         for (i = 0; i < dm_table_get_num_targets(t); i++) {
> > @@ -901,7 +908,14 @@ static bool dm_table_supports_dax(struct dm_table *t)
> >                 if (!ti->type->iterate_devices ||
> >                     !ti->type->iterate_devices(ti, device_supports_dax,
> >                     NULL))
> >                         return false;
> > +
> > +               /* Check devices support synchronous DAX */
> > +               if (dax_sync &&
> > +                   !ti->type->iterate_devices(ti, device_synchronous,
> > NULL))
> > +                       dax_sync = false;
> 
> Looks like this needs to be rebased on the current state of v5.2-rc,
> and then we can nudge Mike for an ack.

Sorry! for late reply due to vacations. I will rebase the series on v5.2-rc4 and
send a v11.

Thanks,
Pankaj
Yes, 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
