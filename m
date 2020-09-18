Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF1626EE2F
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 04:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600396015;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A9bnhq4x6Su1gEOo3GfMAfZZ523jqhadzzEOp8CPgDM=;
	b=GGcA7nYDJWYc58bGqBNP4hLnM2FR+tKlMCz+QDlBOKUAE+rAs1zrQVaK3q8OcqX9piJwtE
	VU2PS2lUeTbJJk8d1ku3yq4lmODk6KD2kCrH+PUcE53Hd9FdijthNSzm4L6djQyoBz/3Uk
	l9Lp/Av4Wd2rPt3RBsiCrAh8XrOuqE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-8np14YsvN3y3RvrdV9ef_Q-1; Thu, 17 Sep 2020 22:26:52 -0400
X-MC-Unique: 8np14YsvN3y3RvrdV9ef_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E756425D2;
	Fri, 18 Sep 2020 02:26:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C91B7366D;
	Fri, 18 Sep 2020 02:26:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8287183D040;
	Fri, 18 Sep 2020 02:26:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08I2QV6g017812 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 22:26:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D8D9C1C4; Fri, 18 Sep 2020 02:26:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FC6F73668;
	Fri, 18 Sep 2020 02:26:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08I2QRbv024206; 
	Thu, 17 Sep 2020 21:26:27 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08I2QRd9024205;
	Thu, 17 Sep 2020 21:26:27 -0500
Date: Thu, 17 Sep 2020 21:26:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200918022626.GU11108@octiron.msp.redhat.com>
References: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <d89bc33d-8e5d-d194-3b26-83ff4d170c5c@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 0/6] libmultipath: check udev* func return
	value
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 15, 2020 at 12:38:27PM +0800, lixiaokeng wrote:
> Hi,
>   The udev* function may return NULL,and it will be
> dereferenced in str* and sscanf func. For example,
> there is a coredump caused in add func, which show in
> be7a043(commit id) in upstream-queue. We check the
> return value to avoid dereference NULL.
> 
> repo: openSUSE/multipath-tools
> repo link: https://github.com/openSUSE/multipath-tools
> branch: upstream-queue
> 
For the set
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>


> lixiaokeng (6):
>   libmultipath: check uedv* return value in sysfs_get_host_pci_name
>   libmultipath: check udev* return value in ccw_sysfs_pathinfo
>   libmultipath: check udev* return value in sysfs_get_tgt_nodename
>   libmultipath: check udev* return value in
>     trigger_partitions_udev_change
>   libmultipath: check udev* renturn value in get_ctrl_blkdev
>   libmultipath: check udev* return value in _find_path_by_syspath
> 
>  libmultipath/configure.c    |  4 +++-
>  libmultipath/discovery.c    |  9 +++++++--
>  libmultipath/foreign/nvme.c | 10 +++++++---
>  3 files changed, 17 insertions(+), 6 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

