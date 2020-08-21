Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3400B24E03E
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 21:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598036485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U1QDUCQ61zbxFucekHuKHSW9SV+Ly/Vv9TxXt2VpRjE=;
	b=bzfkiYXrZfirhW/us4sQGn9HZwRo4Aywc4FX5YyS7LPGHKUMYFIlLhQGgQ6kMbWEUL9jJs
	XLqQbrO0KJBgjrXDQB75MJxE3blsmx1euKxml8E9kFKGIcxEKM6kKJ+skQqAgdi16ylhnG
	1a0AfdhZW5f7sENPGirwXRkJMWz+dvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-pWm2FAdLMimG35uijY6ajQ-1; Fri, 21 Aug 2020 15:01:22 -0400
X-MC-Unique: pWm2FAdLMimG35uijY6ajQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF9418551AB;
	Fri, 21 Aug 2020 19:01:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E09557AECB;
	Fri, 21 Aug 2020 19:01:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A721A662CA;
	Fri, 21 Aug 2020 19:00:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LIvTeo008498 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 14:57:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21BCD5D9CC; Fri, 21 Aug 2020 18:57:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 200905DA7B;
	Fri, 21 Aug 2020 18:57:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07LIvOxq021705; 
	Fri, 21 Aug 2020 13:57:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07LIvOCx021704;
	Fri, 21 Aug 2020 13:57:24 -0500
Date: Fri, 21 Aug 2020 13:57:24 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200821185724.GY19233@octiron.msp.redhat.com>
References: <20200821135418.28138-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200821135418.28138-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 0/3] discard broken maps in get_dm_mpvec
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Aug 21, 2020 at 03:54:15PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Hello lixiaokeng,
> 
> please check if this fixes the issue you reported in
> "libmultipath fix NULL dereference in select_action"
> (https://www.redhat.com/archives/dm-devel/2020-August/msg00246.html).
> 
> As discussed before, the idea is to discard broken / incompletely
> initialized maps in get_dm_mpvec().
> 
> Regards
> Martin
> 

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> Martin Wilck (3):
>   libmultipath: update_multipath_table(): add flags argument
>   libmultipath: remove_map(): separate pathvec and mpvec arguments
>   multipath: get_dm_mpvec: discard broken maps
> 
>  libmultipath/configure.c   | 11 ++++++-----
>  libmultipath/structs_vec.c | 20 ++++++++++----------
>  libmultipath/structs_vec.h | 10 +++++++---
>  multipath/main.c           | 23 +++++++++--------------
>  multipathd/dmevents.c      |  2 +-
>  multipathd/main.c          | 16 ++++++++--------
>  6 files changed, 41 insertions(+), 41 deletions(-)
> 
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

