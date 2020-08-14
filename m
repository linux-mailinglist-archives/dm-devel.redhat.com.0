Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B64AE24446F
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 07:09:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597381764;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sN56MKEYHkDrI+KPJ4defSRBW0n1avgwjzHxmZnYlm0=;
	b=KdfwOgF4nApBFXlMY+aUBngRX/tu3zDO+NMPR9zNccN23GYrq/0sbsR7wtm9Nq7PoCCDJt
	2JTLiHRrqwMVjFqJhHd3myGFA/WbOthz86FRSnZsbObI2bzB8KdDkAdwxoxQkaAda1WaCv
	K+KDURWj5wqRvTBeSoATqZFaZswXijs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-DRvUkM0_MOK3uAW0GPlkhg-1; Fri, 14 Aug 2020 01:09:21 -0400
X-MC-Unique: DRvUkM0_MOK3uAW0GPlkhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E6C11030C5A;
	Fri, 14 Aug 2020 05:09:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 566CE709CD;
	Fri, 14 Aug 2020 05:09:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA42D4EE15;
	Fri, 14 Aug 2020 05:09:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E58pDR027951 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Aug 2020 01:08:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D322360C87; Fri, 14 Aug 2020 05:08:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E997460C04;
	Fri, 14 Aug 2020 05:08:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07E58llk032110; 
	Fri, 14 Aug 2020 00:08:47 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07E58lFr032109;
	Fri, 14 Aug 2020 00:08:47 -0500
Date: Fri, 14 Aug 2020 00:08:46 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200814050846.GF19233@octiron.msp.redhat.com>
References: <20200812113511.26469-1-mwilck@suse.com>
	<20200812113511.26469-8-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113511.26469-8-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 66/74] libmultipath:
 update_pathvec_from_dm: handle pp->mpp mismatch
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

On Wed, Aug 12, 2020 at 01:35:10PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Treat this like a WWID mismatch.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index bd2d13b..e7a8d53 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -123,6 +123,23 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
>  			goto delete_pg;
>  
>  		vector_foreach_slot(pgp->paths, pp, j) {
> +
> +			if (pp->mpp && pp->mpp != mpp) {
> +				condlog(0, "BUG: %s: found path %s which is already in %s",
> +					mpp->alias, pp->dev, pp->mpp->alias);
> +
> +				/*
> +				 * Either we added this path to the other mpp
> +				 * explicitly, or we came by here earlier and
> +				 * decided it belonged there. In both cases,
> +				 * the path should remain in the other map,
> +				 * and be deleted here.
> +				 */
> +				must_reload = true;
> +				dm_fail_path(mpp->alias, pp->dev_t);
> +				vector_del_slot(pgp->paths, j--);
> +				continue;
> +			}
>  			pp->mpp = mpp;
>  
>  			/*
> @@ -170,6 +187,22 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
>  					vector_del_slot(pgp->paths, j--);
>  					free_path(pp);
>  					must_reload = true;
> +				} else if (mpp_has_wwid && pp->wwid[0] != '\0'
> +					   && strcmp(mpp->wwid, pp->wwid)) {
> +					condlog(0, "%s: path %s WWID %s doesn't match, removing from map",
> +						mpp->wwid, pp->dev_t, pp->wwid);
> +					/*
> +					 * This path exists, but in the wrong map.
> +					 * We can't reload the map from here.
> +					 * Make sure it isn't used in this map
> +					 * any more, and let the checker re-add
> +					 * it as it sees fit.
> +					 */
> +					dm_fail_path(mpp->alias, pp->dev_t);
> +					vector_del_slot(pgp->paths, j--);
> +					orphan_path(pp, "WWID mismatch");
> +					pp->tick = 1;
> +					must_reload = true;
>  				} else {
>  					if (mpp_has_wwid && !strlen(pp->wwid)) {
>  						condlog(3, "%s: setting wwid from map: %s",
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

