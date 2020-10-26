Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 82E3A298A9D
	for <lists+dm-devel@lfdr.de>; Mon, 26 Oct 2020 11:44:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-C3uB6cf_NcCXslWKx-uuIQ-1; Mon, 26 Oct 2020 06:44:17 -0400
X-MC-Unique: C3uB6cf_NcCXslWKx-uuIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 763A880B70A;
	Mon, 26 Oct 2020 10:44:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 305D319C66;
	Mon, 26 Oct 2020 10:44:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F8E11826D3A;
	Mon, 26 Oct 2020 10:44:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09QAhoGK009883 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 26 Oct 2020 06:43:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56BC86379A; Mon, 26 Oct 2020 10:43:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5192063536
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 10:43:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDD1C800161
	for <dm-devel@redhat.com>; Mon, 26 Oct 2020 10:43:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-375-Wr1chZMNMuew74TuXkvhOg-1;
	Mon, 26 Oct 2020 06:43:43 -0400
X-MC-Unique: Wr1chZMNMuew74TuXkvhOg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 25F19B301;
	Mon, 26 Oct 2020 10:43:42 +0000 (UTC)
Message-ID: <6b99062343bcbf097421d5a3f12b96ebe32cdcb8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Mon, 26 Oct 2020 11:43:40 +0100
In-Reply-To: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
References: <2a95503c-da40-391c-ce76-bdde19636b51@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
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
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 0/6] multipath-tools history bug in 0.4.9
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello Lixiaokeng,

On Mon, 2020-10-26 at 17:23 +0800, lixiaokeng wrote:
> Hi,
> 
> There are some old patches in our multipath-tools code. They fix some
> bugs in old version (0.4.9). I'm not the auther of these patches,
> but I send them. Please review.Thanks.

Thanks for the patches, but unless you can provide evidence that the
issues are still present in recent upstream code, we likely won't
bother with this on dm-devel. Please report this to the distribution(s)
you are using that are still shipping the old multipath-tools versions.

Regards,
Martin

> 
> lixiaokeng (3):
>   fix multipathd resize when not all sizes of paths are equal
>   fix lun expansion failure when there is offline path
>   flush and sync before reboot
> 
> sunguoshuai (3):
>   check pgp to avoid NULL dereference in enable_group
>   fix change reservtion key to uint8 for memcmp
>   ignore for clear mismatch key
> 
>  libmpathpersist/mpath_persist.c  | 27 ++++++++++++++++++++-------
>  libmultipath/configure.c         | 18 ++++++++++++++++++
>  libmultipath/prioritizers/alua.c |  4 ++++
>  libmultipath/prioritizers/emc.c  |  2 +-
>  libmultipath/prioritizers/hds.c  | 19 +++++++++++--------
>  libmultipath/structs.c           |  1 +
>  libmultipath/structs.h           |  1 +
>  libmultipath/structs_vec.c       | 10 +++++++---
>  libmultipath/util.c              |  7 +++++++
>  multipathd/cli_handlers.c        | 19 ++++++++++++++++++-
>  multipathd/main.c                |  5 +++++
>  11 files changed, 93 insertions(+), 20 deletions(-)
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

