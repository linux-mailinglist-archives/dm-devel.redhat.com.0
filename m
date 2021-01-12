Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6B52F256A
	for <lists+dm-devel@lfdr.de>; Tue, 12 Jan 2021 02:45:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610415914;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=B7fT+QTIrC2cdzFoPaR6r7hvCqzEss0oRxSUOFETj7I=;
	b=HlQo7uHFHm5BSzzApnzCbe4dIGlSHcPzjZnkY1BIVQDV01s3xToaHTonW/nyfBYM+pFAdt
	6La0gwaOfcYa7+vZpcJ2VvbwuYlyk5FkTEjxq8dNXdTL/KSYo9iqP4q0dtZqjWQ3+ImLDq
	+XZ6vj2uM33RMGWLeYKbGXUaKSx5HPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-igC8rGFtP1WQ395A2ta_7w-1; Mon, 11 Jan 2021 20:45:12 -0500
X-MC-Unique: igC8rGFtP1WQ395A2ta_7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1BCE801AA9;
	Tue, 12 Jan 2021 01:45:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 082245C1B4;
	Tue, 12 Jan 2021 01:45:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 596DA180954D;
	Tue, 12 Jan 2021 01:44:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10C1igTl018396 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 20:44:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 07F7676E3C; Tue, 12 Jan 2021 01:44:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ECBC60C5B;
	Tue, 12 Jan 2021 01:44:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10C1ibLJ000979; 
	Mon, 11 Jan 2021 19:44:37 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10C1iamn000978;
	Mon, 11 Jan 2021 19:44:36 -0600
Date: Mon, 11 Jan 2021 19:44:36 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210112014436.GX3103@octiron.msp.redhat.com>
References: <20210108170044.7883-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210108170044.7883-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/3] multipath-tools: cleanup uevent
	generation on startup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 08, 2021 at 06:00:41PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>

For the set

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> This series undoes several changes I did myself in an attempt to fix
> issues with multipath maps incompletely initialized in udev. They are
> now all superseded by 0d66e03 ("libmultipath: force map reload if 
> udev incomplete"). Triggering artificial (spurious) uevents for
> dm devices is useless in almost all cases. If some map is found in an
> inconsistent or incomplete state, the only action that would fix it
> is a full map reload.
> 
> While the code reverted here doesn't do actual harm, it unnecessarily
> complicates matters, wastes resources, and may leave readers of
> the code with wrong ideas how to handle udev issues in multipathd.
> 
> Martin Wilck (3):
>   libmultipath: select_action(): skip is_mpp_known_to_udev() test
>   libmultipath: coalesce_paths(): stop triggering spurious uevents
>   Revert "multipathd: uev_trigger(): handle incomplete ADD events"
> 
>  libmultipath/configure.c | 39 ---------------------------------------
>  multipathd/main.c        | 25 -------------------------
>  2 files changed, 64 deletions(-)
> 
> -- 
> 2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

