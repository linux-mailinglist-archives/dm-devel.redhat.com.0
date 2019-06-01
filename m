Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 000D3319EC
	for <lists+dm-devel@lfdr.de>; Sat,  1 Jun 2019 08:29:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F05930C1FE5;
	Sat,  1 Jun 2019 06:29:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EC2D541C1;
	Sat,  1 Jun 2019 06:29:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DA59206D2;
	Sat,  1 Jun 2019 06:29:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x516TBOG024497 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 1 Jun 2019 02:29:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D57066605; Sat,  1 Jun 2019 06:29:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25AFD4D711
	for <dm-devel@redhat.com>; Sat,  1 Jun 2019 06:29:09 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1CD353001D53
	for <dm-devel@redhat.com>; Sat,  1 Jun 2019 06:29:08 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 107so5600394otj.8
	for <dm-devel@redhat.com>; Fri, 31 May 2019 23:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pvQK6WJG0mGv3pVSu5OSYb8LqyE3fhcFrJhciECSYJY=;
	b=zAq3dmDcYmDOFRGWPRho3n9VwHtS/ms4RxAtlrWfGP6kzMscluGhAO/pUa4TA+4EUS
	O0/4V2wR9qZcVx3qMS3QoB+HAQeLd2d2CDwsDN1N3DBbRKcGdR7bB+bQJPhBtO5qBBD8
	qYtkmlkUSEKMjZ50q7KpWOF2nJop+rQTGA+KOkHdzHd+G7A7NpsAwm9za6+lD17Xpadt
	bBwCs0HFc6tNdDL6uOqSRQ+UbMp0iEmi4VLXhjbg/8iQ6ZYHFac4FNgAxARif9GzMuH6
	t9gOCBA01URioVkiQ14oCPcK7W+RxbSIJNNYh1f11vuThMbN9aOLBPGBjStFZqhbk42U
	MHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pvQK6WJG0mGv3pVSu5OSYb8LqyE3fhcFrJhciECSYJY=;
	b=NR1A+vv4itIYOc1r5lRc3R+djOLQlTx8EMOalN3hkOKLf+LMgMDg4PiS6uZms+/SaJ
	xEQcEwKOywTzo7VqFAY/1GAUeaakMWhcxFcBTk5cyxxuiUDPopOUMS7E9Y8wA+cibY6q
	67LR5PgCEqV6wmFNOkBED7s9vLPBwI+vKieIez633JqYn8rXTLojxPDB8YL/FtCmDAmI
	belluby2FRThn7touCjvhsf4yjqDihoS8HRW2T2xVcMsXUyxZoKxQAblRZ2TR7OSvuK1
	jLYw8/gs4asfRD171qvhFPlqr3GAS5TNAWrfQEe2LZ+xwHFcPvu00pmyevs2mkqcfi2k
	zl/g==
X-Gm-Message-State: APjAAAWZp8mE6gzD1n9J3GXbBh9RAmO1TgtqhkhUNPS2GtUPxb5bvh97
	2rThSAejMmj8DdoqNPjHwvP73UsfuF2HdLqdkn7qbQ==
X-Google-Smtp-Source: APXvYqxuwOV4rRKEmSZCq5qcwBRWuusFc8LtQ4tAccMQn0kPo+oROMhcV0mbfJCQAHkg4BYqbZdyRhVUU/uCtJ3RX78=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr4259219otn.247.1559370547538; 
	Fri, 31 May 2019 23:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190521133713.31653-1-pagupta@redhat.com>
	<20190521133713.31653-5-pagupta@redhat.com>
In-Reply-To: <20190521133713.31653-5-pagupta@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 31 May 2019 23:28:56 -0700
Message-ID: <CAPcyv4iW-UeHBs+qSii2Pk7Q2Nki6imGBTEORuxEAWgEMMp=nA@mail.gmail.com>
To: Pankaj Gupta <pagupta@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sat, 01 Jun 2019 06:29:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Sat, 01 Jun 2019 06:29:08 +0000 (UTC) for IP:'209.85.210.65'
	DOMAIN:'mail-ot1-f65.google.com' HELO:'mail-ot1-f65.google.com'
	FROM:'dan.j.williams@intel.com' RCPT:''
X-RedHat-Spam-Score: -0.01  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.65 mail-ot1-f65.google.com 209.85.210.65
	mail-ot1-f65.google.com <dan.j.williams@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Sat, 01 Jun 2019 06:29:58 +0000 (UTC)

On Tue, May 21, 2019 at 6:43 AM Pankaj Gupta <pagupta@redhat.com> wrote:
>
>  This patch sets dax device 'DAXDEV_SYNC' flag if all the target
>  devices of device mapper support synchrononous DAX. If device
>  mapper consists of both synchronous and asynchronous dax devices,
>  we don't set 'DAXDEV_SYNC' flag.
>
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  drivers/md/dm-table.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index cde3b49b2a91..1cce626ff576 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -886,10 +886,17 @@ static int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
>         return bdev_dax_supported(dev->bdev, PAGE_SIZE);
>  }
>
> +static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
> +                              sector_t start, sector_t len, void *data)
> +{
> +       return dax_synchronous(dev->dax_dev);
> +}
> +
>  static bool dm_table_supports_dax(struct dm_table *t)
>  {
>         struct dm_target *ti;
>         unsigned i;
> +       bool dax_sync = true;
>
>         /* Ensure that all targets support DAX. */
>         for (i = 0; i < dm_table_get_num_targets(t); i++) {
> @@ -901,7 +908,14 @@ static bool dm_table_supports_dax(struct dm_table *t)
>                 if (!ti->type->iterate_devices ||
>                     !ti->type->iterate_devices(ti, device_supports_dax, NULL))
>                         return false;
> +
> +               /* Check devices support synchronous DAX */
> +               if (dax_sync &&
> +                   !ti->type->iterate_devices(ti, device_synchronous, NULL))
> +                       dax_sync = false;

Looks like this needs to be rebased on the current state of v5.2-rc,
and then we can nudge Mike for an ack.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
