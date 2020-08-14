Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B1A362442FF
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 04:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597371987;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=s3iwtmW6gZLFlLFUnNoPdOaaFwA5VjHUBztwqUvG5ss=;
	b=Ooyw0BtILtavGHKmC6Wa67uvgQaaExVyWnMwjwF7FPs6xR2f4Xz/Ae/ZZz00FwAcAC6SbX
	AMLA4bqd8iVC91aPX7rCYyfsYXFep8RJI4slidV5euo0Yg65XXyrOr7ncufO7pj3RBtMKr
	g5kBNnfXMftBr+MCWzEronfkGaqn5QI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-iFiprOCnPtq6pK2m-wsxcw-1; Thu, 13 Aug 2020 22:26:25 -0400
X-MC-Unique: iFiprOCnPtq6pK2m-wsxcw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21379800D53;
	Fri, 14 Aug 2020 02:26:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CE3B1992D;
	Fri, 14 Aug 2020 02:26:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61B211826D2A;
	Fri, 14 Aug 2020 02:26:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E2QEkl007719 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 22:26:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE8476198E; Fri, 14 Aug 2020 02:26:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0C29610F3;
	Fri, 14 Aug 2020 02:26:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07E2QApe031383; 
	Thu, 13 Aug 2020 21:26:10 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07E2QAGA031382;
	Thu, 13 Aug 2020 21:26:10 -0500
Date: Thu, 13 Aug 2020 21:26:10 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200814022610.GD19233@octiron.msp.redhat.com>
References: <20200812113511.26469-1-mwilck@suse.com>
	<20200812113511.26469-6-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113511.26469-6-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 64/74] libmultipath: orphan_paths(): avoid
	BUG message
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:35:08PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Since c44d769, we print a BUG message when we orphan a path that
> holds the mpp->hwe pointer. But if this called via orphan_paths(),
> this is expected and we shouldn't warn.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Fixes: c44d769 ("libmultipath: warn if freeing path that holds mpp->hwe")
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index ba3165a..b644d3f 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -124,6 +124,8 @@ void orphan_paths(vector pathvec, struct multipath *mpp, const char *reason)
>  	int i;
>  	struct path * pp;
>  
> +	/* Avoid BUG message from orphan_path() */
> +	mpp->hwe = NULL;
>  	vector_foreach_slot (pathvec, pp, i) {
>  		if (pp->mpp == mpp) {
>  			if (pp->initialized == INIT_REMOVED) {
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

