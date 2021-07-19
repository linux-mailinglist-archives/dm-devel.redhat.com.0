Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 203E93CDABB
	for <lists+dm-devel@lfdr.de>; Mon, 19 Jul 2021 17:18:43 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-t4_K94yNNOSWoHvZadu62g-1; Mon, 19 Jul 2021 11:18:41 -0400
X-MC-Unique: t4_K94yNNOSWoHvZadu62g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 904C0C73A6;
	Mon, 19 Jul 2021 15:18:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5D4E5D6A1;
	Mon, 19 Jul 2021 15:18:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD8C01809C99;
	Mon, 19 Jul 2021 15:18:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16JFHs8W028707 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Jul 2021 11:17:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A065529EE; Mon, 19 Jul 2021 15:17:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BA792D459
	for <dm-devel@redhat.com>; Mon, 19 Jul 2021 15:17:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B97D845DF8
	for <dm-devel@redhat.com>; Mon, 19 Jul 2021 15:17:51 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-511-XrupGkVXP6a3RShhRfaPbA-1;
	Mon, 19 Jul 2021 11:17:48 -0400
X-MC-Unique: XrupGkVXP6a3RShhRfaPbA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id E6FF767373; Mon, 19 Jul 2021 17:17:44 +0200 (CEST)
Date: Mon, 19 Jul 2021 17:17:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Shiyang Ruan <ruansy.fnst@fujitsu.com>
Message-ID: <20210719151744.GA22718@lst.de>
References: <20210628000218.387833-1-ruansy.fnst@fujitsu.com>
	<20210628000218.387833-3-ruansy.fnst@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20210628000218.387833-3-ruansy.fnst@fujitsu.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: nvdimm@lists.linux.dev, snitzer@redhat.com, darrick.wong@oracle.com,
	rgoldwyn@suse.de, david@fromorbit.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, dan.j.williams@intel.com,
	hch@lst.de, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v5 2/9] dax: Introduce holder for dax_device
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 28, 2021 at 08:02:11AM +0800, Shiyang Ruan wrote:
> +int dax_holder_notify_failure(struct dax_device *dax_dev, loff_t offset,
> +			      size_t size, void *data)
> +{
> +	int rc = -ENXIO;
> +	if (!dax_dev)
> +		return rc;
> +
> +	if (dax_dev->holder_data) {
> +		rc = dax_dev->holder_ops->notify_failure(dax_dev, offset,
> +							 size, data);
> +		if (rc == -ENODEV)
> +			rc = -ENXIO;
> +	} else
> +		rc = -EOPNOTSUPP;

The style looks a little odd.  Why not:

	if (!dax_dev)
		return -ENXIO
	if (!dax_dev->holder_data)
		return -EOPNOTSUPP;
	return dax_dev->holder_ops->notify_failure(dax_dev, offset, size, data);

and let everyone deal with the same errno codes?

Also why do we even need the dax_dev NULL check?

> +void dax_set_holder(struct dax_device *dax_dev, void *holder,
> +		const struct dax_holder_operations *ops)
> +{
> +	if (!dax_dev)
> +		return;

I don't think we really need that check here.

> +void *dax_get_holder(struct dax_device *dax_dev)
> +{
> +	void *holder_data;
> +
> +	if (!dax_dev)
> +		return NULL;

Same here.

> +
> +	down_read(&dax_dev->holder_rwsem);
> +	holder_data = dax_dev->holder_data;
> +	up_read(&dax_dev->holder_rwsem);
> +
> +	return holder_data;

That lock won't protect anything.  I think we simply must have
synchronization to prevent unregistration while the ->notify_failure
call is in progress.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

