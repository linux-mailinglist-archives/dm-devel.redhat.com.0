Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D6441DC4
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 09:30:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DD8F3D95D;
	Wed, 12 Jun 2019 07:30:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D5F8513EC;
	Wed, 12 Jun 2019 07:30:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAD1A206D1;
	Wed, 12 Jun 2019 07:30:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5BG4nk5015453 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 12:04:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 15513379C; Tue, 11 Jun 2019 16:04:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E65F5C559;
	Tue, 11 Jun 2019 16:04:25 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D31A018363C0;
	Tue, 11 Jun 2019 16:04:21 +0000 (UTC)
Date: Tue, 11 Jun 2019 12:04:21 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <1006124881.34430329.1560269061491.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190611150427.GA29288@redhat.com>
References: <20190610090730.8589-1-pagupta@redhat.com>
	<20190610090730.8589-5-pagupta@redhat.com>
	<20190610192803.GA29002@redhat.com>
	<1206355816.34396746.1560258658768.JavaMail.zimbra@redhat.com>
	<20190611150427.GA29288@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.116.60, 10.4.195.3]
Thread-Topic: enable synchronous dax
Thread-Index: H4DObhswv6RiIzHdNTVFv9g9Hzvnew==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Jun 2019 03:28:18 -0400
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	jasowang@redhat.com, david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger kernel <adilger.kernel@dilger.ca>, zwisler@kernel.org,
	aarcange@redhat.com, dave jiang <dave.jiang@intel.com>,
	jstaron@google.com, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, david@redhat.com,
	willy@infradead.org, hch@infradead.org,
	linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, pbonzini@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, kwolf@redhat.com, nilal@redhat.com,
	tytso@mit.edu, xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	rdunlap@infradead.org, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, imammedo@redhat.com,
	darrick wong <darrick.wong@oracle.com>
Subject: Re: [dm-devel] [Qemu-devel] [PATCH v11 4/7] dm: enable synchronous
	dax
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 12 Jun 2019 07:30:37 +0000 (UTC)



> 
> > Hi Mike,
> > 
> > Thanks for the review Please find my reply inline.
> > 
> > > 
> > > dm_table_supports_dax() is called multiple times (from
> > > dm_table_set_restrictions and dm_table_determine_type).  It is strange
> > > to have a getter have a side-effect of being a setter too.  Overloading
> > > like this could get you in trouble in the future.
> > > 
> > > Are you certain this is what you want?
> > 
> > I agree with you.
> > 
> > > 
> > > Or would it be better to refactor dm_table_supports_dax() to take an
> > > iterate_devices_fn arg and have callers pass the appropriate function?
> > > Then have dm_table_set_restrictions() caller do:
> > > 
> > >      if (dm_table_supports_dax(t, device_synchronous, NULL))
> > >                set_dax_synchronous(t->md->dax_dev);
> > > 
> > > (NULL arg implies dm_table_supports_dax() refactoring would take a int
> > > *data pointer rather than int type).
> > > 
> > > Mike
> > > 
> > 
> > I am sending below patch as per your suggestion. Does it look
> > near to what you have in mind?
> 
> Yes, it does.. just one nit I noticed inlined below.
> 
> > diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> > index 350cf0451456..8d89acc8b8c2 100644
> > --- a/drivers/md/dm-table.c
> > +++ b/drivers/md/dm-table.c
> 
> ...
> 
> > @@ -1910,8 +1919,13 @@ void dm_table_set_restrictions(struct dm_table *t,
> > struct request_queue *q,
> >         }
> >         blk_queue_write_cache(q, wc, fua);
> > 
> > -       if (dm_table_supports_dax(t, PAGE_SIZE))
> > +       if (dm_table_supports_dax(t, device_supports_dax, &page_size)) {
> > +
> 
> No need for an empty newline here ^

Sure. Will remove this and send official v12 patchset with the updated patch 4.

Thanks,
Pankaj

> 
> >                 blk_queue_flag_set(QUEUE_FLAG_DAX, q);
> > +               if (dm_table_supports_dax(t, device_synchronous, NULL))
> > +                       set_dax_synchronous(t->md->dax_dev);
> > +       }
> >         else
> >                 blk_queue_flag_clear(QUEUE_FLAG_DAX, q);
> > 
> 
> Thanks,
> Mike
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
