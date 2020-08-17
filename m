Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0202624786F
	for <lists+dm-devel@lfdr.de>; Mon, 17 Aug 2020 23:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597698056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aytEN0mvgVfAX67lTiNihYmj2mw92vQe4DSQY6U6GWk=;
	b=AbyJV/NkIJctyEUZWvepoY0U5szDLdu2yJl8UdhOMwT85Srm4/D2vSOexXAbEYOxt0B989
	/eDtGr9UJGfkqlhnW9iL8s8p11J0kchhvH4DUysATy67M+TlmQySHvlO5OuX2eaF5UZbey
	WCXAEqU2OUqssYY/Z48fKlYeBSOXPmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-uAmkoDQuMceaaSAXrGg0iA-1; Mon, 17 Aug 2020 17:00:52 -0400
X-MC-Unique: uAmkoDQuMceaaSAXrGg0iA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FF74801AB1;
	Mon, 17 Aug 2020 21:00:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E61AE60BF3;
	Mon, 17 Aug 2020 21:00:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 592D51826D2D;
	Mon, 17 Aug 2020 21:00:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07HL0AvE007027 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Aug 2020 17:00:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0878E7D64A; Mon, 17 Aug 2020 21:00:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B3A67D920;
	Mon, 17 Aug 2020 21:00:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07HL04ql023014; 
	Mon, 17 Aug 2020 16:00:04 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07HL030s023013;
	Mon, 17 Aug 2020 16:00:03 -0500
Date: Mon, 17 Aug 2020 16:00:03 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200817210003.GG19233@octiron.msp.redhat.com>
References: <20200812113511.26469-1-mwilck@suse.com>
	<20200812113511.26469-9-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200812113511.26469-9-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 71/74] multipath: use
	update_pathvec_from_dm()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Aug 12, 2020 at 01:35:11PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The multipath-specific function update_paths() can now be replaced with
> a call to update_pathvec_from_dm().
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  libmultipath/structs_vec.c |  2 +-
>  multipath/main.c           | 68 +++-----------------------------------
>  2 files changed, 5 insertions(+), 65 deletions(-)
> 
> diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
> index 07027f5..2d85df9 100644
> --- a/libmultipath/structs_vec.c
> +++ b/libmultipath/structs_vec.c
> @@ -150,7 +150,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
>  			 * we know that the path is in pathvec already.
>  			 */
>  			if (pp->udev) {
> -				if (pathinfo_flags) {
> +				if (pathinfo_flags & ~DI_NOIO) {
>  					conf = get_multipath_config();
>  					pthread_cleanup_push(put_multipath_config,
>  							     conf);
> diff --git a/multipath/main.c b/multipath/main.c
> index a144bc3..9d6b482 100644
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
> @@ -273,13 +216,9 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
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
> +				       (cmd == CMD_LIST_SHORT ?
> +					DI_NOIO : DI_ALL));
>  
>  		if (cmd == CMD_LIST_LONG)
>  			mpp->bestpg = select_path_group(mpp);
> @@ -353,6 +292,7 @@ static int check_usable_paths(struct config *conf,
>  	dm_get_map(mpp->alias, &mpp->size, params);
>  	dm_get_status(mpp->alias, status);
>  	disassemble_map(pathvec, params, mpp);
> +	update_pathvec_from_dm(pathvec, mpp, 0);
>  	disassemble_status(status, mpp);
>  
>  	vector_foreach_slot (mpp->pg, pg, i) {
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

