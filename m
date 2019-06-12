Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD241DBE
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 09:30:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CABEC004BEB;
	Wed, 12 Jun 2019 07:29:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60FBC5945E;
	Wed, 12 Jun 2019 07:29:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE4D0206D2;
	Wed, 12 Jun 2019 07:29:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C2NOjR025613 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 22:23:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D206363B9E; Wed, 12 Jun 2019 02:23:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B20620DB;
	Wed, 12 Jun 2019 02:23:11 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2391624B25;
	Wed, 12 Jun 2019 02:23:10 +0000 (UTC)
Date: Tue, 11 Jun 2019 22:23:09 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <332155967.34508010.1560306189624.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190611171416.GA1248@redhat.com>
References: <20190611163802.25352-1-pagupta@redhat.com>
	<20190611163802.25352-5-pagupta@redhat.com>
	<20190611171416.GA1248@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.116.70, 10.4.195.27]
Thread-Topic: enable synchronous dax
Thread-Index: 7O59Nmg+n8QzGpvkvBkkxWqWG8w3fA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Jun 2019 03:28:18 -0400
Cc: rdunlap@infradead.org, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
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
	stefanha@redhat.com, imammedo@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, kwolf@redhat.com, nilal@redhat.com,
	tytso@mit.edu, xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	cohuck@redhat.com, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
	darrick wong <darrick.wong@oracle.com>
Subject: Re: [dm-devel] [Qemu-devel] [PATCH v12 4/7] dm: enable synchronous
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 12 Jun 2019 07:30:01 +0000 (UTC)


> On Tue, Jun 11 2019 at 12:37pm -0400,
> Pankaj Gupta <pagupta@redhat.com> wrote:
> 
> > This patch sets dax device 'DAXDEV_SYNC' flag if all the target
> > devices of device mapper support synchrononous DAX. If device
> > mapper consists of both synchronous and asynchronous dax devices,
> > we don't set 'DAXDEV_SYNC' flag.
> > 
> > 'dm_table_supports_dax' is refactored to pass 'iterate_devices_fn'
> > as argument so that the callers can pass the appropriate functions.
> > 
> > Suggested-by: Mike Snitzer <snitzer@redhat.com>
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> 
> Thanks, and for the benefit of others, passing function pointers like
> this is perfectly fine IMHO because this code is _not_ in the fast
> path.  These methods are only for device creation.
> 
> Reviewed-by: Mike Snitzer <snitzer@redhat.com>

Thank you, Mike

Best regards,
Pankaj

> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
