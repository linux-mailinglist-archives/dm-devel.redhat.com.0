Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 11B9B225608
	for <lists+dm-devel@lfdr.de>; Mon, 20 Jul 2020 04:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595213912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zJQEmRa7uDnpTPtIeNNPof3rvLw3hjUNAGaU3rB79AI=;
	b=H4tcZJ4N7bjmC6p5azyuD3BJ1iLrjYRtApyojzs6RsrGrhrFJu8ZLAU+S3mCKnKrwK1ttu
	HAQpQkfoWHvfdaqNpuKpqCRmF+E/LhYxFqNB5jJ/Wc82tkZYoYsXdG6r7yjV6FWX1x+Lz/
	yP7JBeouFg5Y2iAoKOv3bpp1xLOQhLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-sOAlQY8oN5m2OuLcVeoHFA-1; Sun, 19 Jul 2020 22:58:29 -0400
X-MC-Unique: sOAlQY8oN5m2OuLcVeoHFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84FEF10059A7;
	Mon, 20 Jul 2020 02:58:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02F882B6D6;
	Mon, 20 Jul 2020 02:58:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 428101809554;
	Mon, 20 Jul 2020 02:58:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06K2vvEY014032 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 Jul 2020 22:57:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E265073046; Mon, 20 Jul 2020 02:57:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4684710C3;
	Mon, 20 Jul 2020 02:57:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06K2vrpq013141; 
	Sun, 19 Jul 2020 21:57:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06K2vqYd013140;
	Sun, 19 Jul 2020 21:57:52 -0500
Date: Sun, 19 Jul 2020 21:57:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200720025752.GZ11089@octiron.msp.redhat.com>
References: <20200709105145.9211-1-mwilck@suse.com>
	<20200709105145.9211-19-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200709105145.9211-19-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 71/74] multipath: use update_pathvec_from_dm()
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jul 09, 2020 at 12:51:42PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The multipath-specific function update_paths() can now be replaced with
> a call to update_pathvec_from_dm().
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipath/main.c | 67 +++---------------------------------------------
>  1 file changed, 3 insertions(+), 64 deletions(-)
> 
> diff --git a/multipath/main.c b/multipath/main.c
> index 8a2a6f7..435c5d5 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -187,63 +187,6 @@ usage (char * progname)
>  
>  }
>  
> -static int
> -update_paths (struct multipath * mpp, int quick)
> -{
> -	int i, j;
> -	struct pathgroup * pgp;
> -	struct path * pp;
> -	struct config *conf;
> -
> -	if (!mpp->pg)
> -		return 0;
> -
> -	vector_foreach_slot (mpp->pg, pgp, i) {
> -		if (!pgp->paths)
> -			continue;
> -
> -		vector_foreach_slot (pgp->paths, pp, j) {
> -			if (!strlen(pp->dev)) {
> -				if (devt2devname(pp->dev, FILE_NAME_SIZE,
> -						 pp->dev_t)) {
> -					/*
> -					 * path is not in sysfs anymore
> -					 */
> -					pp->chkrstate = pp->state = PATH_DOWN;
> -					pp->offline = 1;
> -					continue;
> -				}
> -				pp->mpp = mpp;
> -				if (quick)
> -					continue;
> -				conf = get_multipath_config();
> -				if (pathinfo(pp, conf, DI_ALL))
> -					pp->state = PATH_UNCHECKED;
> -				put_multipath_config(conf);
> -				continue;
> -			}
> -			pp->mpp = mpp;
> -			if (quick)
> -				continue;
> -			if (pp->state == PATH_UNCHECKED ||
> -			    pp->state == PATH_WILD) {
> -				conf = get_multipath_config();
> -				if (pathinfo(pp, conf, DI_CHECKER))
> -					pp->state = PATH_UNCHECKED;
> -				put_multipath_config(conf);
> -			}
> -
> -			if (pp->priority == PRIO_UNDEF) {
> -				conf = get_multipath_config();
> -				if (pathinfo(pp, conf, DI_PRIO))
> -					pp->priority = PRIO_UNDEF;
> -				put_multipath_config(conf);
> -			}
> -		}
> -	}
> -	return 0;
> -}
> -
>  static int
>  get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
>  {
> @@ -273,13 +216,8 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
>  		condlog(3, "status = %s", status);
>  
>  		disassemble_map(pathvec, params, mpp);
> -
> -		/*
> -		 * disassemble_map() can add new paths to pathvec.
> -		 * If not in "fast list mode", we need to fetch information
> -		 * about them
> -		 */
> -		update_paths(mpp, (cmd == CMD_LIST_SHORT));
> +		update_pathvec_from_dm(pathvec, mpp,
> +				       (cmd == CMD_LIST_SHORT ? 0 : DI_ALL));

I personally don't think that "multipath -l" should be opening the path
fd. Checking sysfs seems like the limit of what we want to do for fast
listing. So, I would prefer

update_pathvec_from_dm(pathvec, mpp,
		       (cmd == CMD_LIST_SHORT ? DI_NOIO : DI_ALL));

That will make pathinfo exit early.

-Ben

>  
>  		if (cmd == CMD_LIST_LONG)
>  			mpp->bestpg = select_path_group(mpp);
> @@ -353,6 +291,7 @@ static int check_usable_paths(struct config *conf,
>  	dm_get_map(mpp->alias, &mpp->size, params);
>  	dm_get_status(mpp->alias, status);
>  	disassemble_map(pathvec, params, mpp);
> +	update_pathvec_from_dm(pathvec, mpp, 0);
>  	disassemble_status(status, mpp);
>  
>  	vector_foreach_slot (mpp->pg, pg, i) {
> -- 
> 2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

