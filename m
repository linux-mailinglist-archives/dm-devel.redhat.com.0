Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1DDD40D07E
	for <lists+dm-devel@lfdr.de>; Thu, 16 Sep 2021 01:53:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631750033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AYbakZ3Ovfl5639Foi/jsp8udaS1u6+oP7uIqSzDs6Q=;
	b=EKvJguDhLqLAmT+6XmJm/R1jTIEi6tcGYrb9c+C7mMNXiIUylEpO2fA0S213CZzAfzow24
	aoRyZJtd0XdYNtR53AwRlp2iwJVujm+m4sMliL1inld8odj3yPjg48aWowshJYI2/dSOKl
	BS6ACLI3JKW7dcZJtZ+Lnt1T+yZlrJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-_oi2mzVjOT2SAriCeY_Khg-1; Wed, 15 Sep 2021 19:53:51 -0400
X-MC-Unique: _oi2mzVjOT2SAriCeY_Khg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8955C802B9E;
	Wed, 15 Sep 2021 23:53:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6835D5C1D1;
	Wed, 15 Sep 2021 23:53:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96C361809C81;
	Wed, 15 Sep 2021 23:53:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18FNrgRx014845 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Sep 2021 19:53:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8E31A4180; Wed, 15 Sep 2021 23:53:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA3953E08;
	Wed, 15 Sep 2021 23:53:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 18FNrZxF006678; 
	Wed, 15 Sep 2021 18:53:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 18FNrZvD006677;
	Wed, 15 Sep 2021 18:53:35 -0500
Date: Wed, 15 Sep 2021 18:53:34 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210915235334.GW3087@octiron.msp.redhat.com>
References: <20210910114120.13665-1-mwilck@suse.com>
	<20210910114120.13665-12-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210910114120.13665-12-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Chongyun Wu <wu.chongyun@h3c.com>
Subject: Re: [dm-devel] [PATCH 11/35] multipathd: make all cli_handlers
	static
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 01:40:56PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The cli_handler functions are only called from the handler table and
> need not be exported.
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  multipathd/cli_handlers.c | 214 ++++++++++++++++++++++----------------
>  multipathd/cli_handlers.h |  61 ++---------
>  multipathd/main.c         |  58 +----------
>  3 files changed, 134 insertions(+), 199 deletions(-)
> 
> diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
> index 2e4b239..1a9c822 100644
> --- a/multipathd/cli_handlers.c
> +++ b/multipathd/cli_handlers.c
> @@ -39,7 +39,7 @@
>  		*(__len) = *(__rep) ? sizeof(string_literal) : 0;	\
>  	} while (0)
>  
> -int
> +static int
>  show_paths (char ** r, int * len, struct vectors * vecs, char * style,
>  	    int pretty)
>  {
> @@ -70,7 +70,7 @@ show_paths (char ** r, int * len, struct vectors * vecs, char * style,
>  	return 0;
>  }
>  
> -int
> +static int
>  show_path (char ** r, int * len, struct vectors * vecs, struct path *pp,
>  	   char * style)
>  {
> @@ -85,7 +85,7 @@ show_path (char ** r, int * len, struct vectors * vecs, struct path *pp,
>  	return 0;
>  }
>  
> -int
> +static int
>  show_map_topology (char ** r, int * len, struct multipath * mpp,
>  		   struct vectors * vecs)
>  {
> @@ -102,7 +102,7 @@ show_map_topology (char ** r, int * len, struct multipath * mpp,
>  	return 0;
>  }
>  
> -int
> +static int
>  show_maps_topology (char ** r, int * len, struct vectors * vecs)
>  {
>  	STRBUF_ON_STACK(reply);
> @@ -128,7 +128,7 @@ show_maps_topology (char ** r, int * len, struct vectors * vecs)
>  	return 0;
>  }
>  
> -int
> +static int
>  show_maps_json (char ** r, int * len, struct vectors * vecs)
>  {
>  	STRBUF_ON_STACK(reply);
> @@ -149,7 +149,7 @@ show_maps_json (char ** r, int * len, struct vectors * vecs)
>  	return 0;
>  }
>  
> -int
> +static int
>  show_map_json (char ** r, int * len, struct multipath * mpp,
>  		   struct vectors * vecs)
>  {
> @@ -194,7 +194,7 @@ reset_stats(struct multipath * mpp)
>  	mpp->stat_map_failures = 0;
>  }
>  
> -int
> +static int
>  cli_list_config (void * v, char ** reply, int * len, void * data)
>  {
>  	condlog(3, "list config (operator)");
> @@ -207,7 +207,7 @@ static void v_free(void *x)
>  	vector_free(x);
>  }
>  
> -int
> +static int
>  cli_list_config_local (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -223,7 +223,7 @@ cli_list_config_local (void * v, char ** reply, int * len, void * data)
>  	return ret;
>  }
>  
> -int
> +static int
>  cli_list_paths (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -233,7 +233,7 @@ cli_list_paths (void * v, char ** reply, int * len, void * data)
>  	return show_paths(reply, len, vecs, PRINT_PATH_CHECKER, 1);
>  }
>  
> -int
> +static int
>  cli_list_paths_fmt (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -244,7 +244,7 @@ cli_list_paths_fmt (void * v, char ** reply, int * len, void * data)
>  	return show_paths(reply, len, vecs, fmt, 1);
>  }
>  
> -int
> +static int
>  cli_list_paths_raw (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -255,7 +255,7 @@ cli_list_paths_raw (void * v, char ** reply, int * len, void * data)
>  	return show_paths(reply, len, vecs, fmt, 0);
>  }
>  
> -int
> +static int
>  cli_list_path (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -272,7 +272,7 @@ cli_list_path (void * v, char ** reply, int * len, void * data)
>  	return show_path(reply, len, vecs, pp, "%o");
>  }
>  
> -int
> +static int
>  cli_list_map_topology (void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -291,7 +291,7 @@ cli_list_map_topology (void * v, char ** reply, int * len, void * data)
>  	return show_map_topology(reply, len, mpp, vecs);
>  }
>  
> -int
> +static int
>  cli_list_maps_topology (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -301,7 +301,7 @@ cli_list_maps_topology (void * v, char ** reply, int * len, void * data)
>  	return show_maps_topology(reply, len, vecs);
>  }
>  
> -int
> +static int
>  cli_list_map_json (void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -320,7 +320,7 @@ cli_list_map_json (void * v, char ** reply, int * len, void * data)
>  	return show_map_json(reply, len, mpp, vecs);
>  }
>  
> -int
> +static int
>  cli_list_maps_json (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -330,7 +330,7 @@ cli_list_maps_json (void * v, char ** reply, int * len, void * data)
>  	return show_maps_json(reply, len, vecs);
>  }
>  
> -int
> +static int
>  cli_list_wildcards (void * v, char ** reply, int * len, void * data)
>  {
>  	STRBUF_ON_STACK(buf);
> @@ -343,7 +343,7 @@ cli_list_wildcards (void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  show_status (char ** r, int *len, struct vectors * vecs)
>  {
>  	STRBUF_ON_STACK(reply);
> @@ -356,7 +356,7 @@ show_status (char ** r, int *len, struct vectors * vecs)
>  	return 0;
>  }
>  
> -int
> +static int
>  show_daemon (char ** r, int *len)
>  {
>  	STRBUF_ON_STACK(reply);
> @@ -370,7 +370,7 @@ show_daemon (char ** r, int *len)
>  	return 0;
>  }
>  
> -int
> +static int
>  show_map (char ** r, int *len, struct multipath * mpp, char * style,
>  	  int pretty)
>  {
> @@ -384,7 +384,7 @@ show_map (char ** r, int *len, struct multipath * mpp, char * style,
>  	return 0;
>  }
>  
> -int
> +static int
>  show_maps (char ** r, int *len, struct vectors * vecs, char * style,
>  	   int pretty)
>  {
> @@ -419,7 +419,7 @@ show_maps (char ** r, int *len, struct vectors * vecs, char * style,
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_list_maps_fmt (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -430,7 +430,7 @@ cli_list_maps_fmt (void * v, char ** reply, int * len, void * data)
>  	return show_maps(reply, len, vecs, fmt, 1);
>  }
>  
> -int
> +static int
>  cli_list_maps_raw (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -441,7 +441,7 @@ cli_list_maps_raw (void * v, char ** reply, int * len, void * data)
>  	return show_maps(reply, len, vecs, fmt, 0);
>  }
>  
> -int
> +static int
>  cli_list_map_fmt (void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -461,27 +461,7 @@ cli_list_map_fmt (void * v, char ** reply, int * len, void * data)
>  	return show_map(reply, len, mpp, fmt, 1);
>  }
>  
> -int
> -cli_list_map_raw (void * v, char ** reply, int * len, void * data)
> -{
> -	struct multipath * mpp;
> -	struct vectors * vecs = (struct vectors *)data;
> -	char * param = get_keyparam(v, MAP);
> -	char * fmt = get_keyparam(v, FMT);
> -
> -	param = convert_dev(param, 0);
> -	get_path_layout(vecs->pathvec, 0);
> -	get_multipath_layout(vecs->mpvec, 1);
> -	mpp = find_mp_by_str(vecs->mpvec, param);
> -	if (!mpp)
> -		return 1;
> -
> -	condlog(3, "list map %s fmt %s (operator)", param, fmt);
> -
> -	return show_map(reply, len, mpp, fmt, 0);
> -}
> -
> -int
> +static int
>  cli_list_maps (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -491,7 +471,7 @@ cli_list_maps (void * v, char ** reply, int * len, void * data)
>  	return show_maps(reply, len, vecs, PRINT_MAP_NAMES, 1);
>  }
>  
> -int
> +static int
>  cli_list_status (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -501,7 +481,7 @@ cli_list_status (void * v, char ** reply, int * len, void * data)
>  	return show_status(reply, len, vecs);
>  }
>  
> -int
> +static int
>  cli_list_maps_status (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -511,7 +491,7 @@ cli_list_maps_status (void * v, char ** reply, int * len, void * data)
>  	return show_maps(reply, len, vecs, PRINT_MAP_STATUS, 1);
>  }
>  
> -int
> +static int
>  cli_list_maps_stats (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -521,7 +501,7 @@ cli_list_maps_stats (void * v, char ** reply, int * len, void * data)
>  	return show_maps(reply, len, vecs, PRINT_MAP_STATS, 1);
>  }
>  
> -int
> +static int
>  cli_list_daemon (void * v, char ** reply, int * len, void * data)
>  {
>  	condlog(3, "list daemon (operator)");
> @@ -529,7 +509,7 @@ cli_list_daemon (void * v, char ** reply, int * len, void * data)
>  	return show_daemon(reply, len);
>  }
>  
> -int
> +static int
>  cli_reset_maps_stats (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -544,7 +524,7 @@ cli_reset_maps_stats (void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_reset_map_stats (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -562,7 +542,7 @@ cli_reset_map_stats (void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_add_path (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -678,7 +658,7 @@ blacklisted:
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_del_path (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -701,7 +681,7 @@ cli_del_path (void * v, char ** reply, int * len, void * data)
>  	return (ret == REMOVE_PATH_FAILURE);
>  }
>  
> -int
> +static int
>  cli_add_map (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -761,7 +741,7 @@ cli_add_map (void * v, char ** reply, int * len, void * data)
>  	return rc;
>  }
>  
> -int
> +static int
>  cli_del_map (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -790,7 +770,7 @@ cli_del_map (void * v, char ** reply, int * len, void * data)
>  	return rc;
>  }
>  
> -int
> +static int
>  cli_del_maps (void *v, char **reply, int *len, void *data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -809,7 +789,7 @@ cli_del_maps (void *v, char **reply, int *len, void *data)
>  	return ret;
>  }
>  
> -int
> +static int
>  cli_reload(void *v, char **reply, int *len, void *data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -837,7 +817,7 @@ cli_reload(void *v, char **reply, int *len, void *data)
>  	return reload_and_sync_map(mpp, vecs, 0);
>  }
>  
> -int resize_map(struct multipath *mpp, unsigned long long size,
> +static int resize_map(struct multipath *mpp, unsigned long long size,
>  	       struct vectors * vecs)
>  {
>  	char *params __attribute__((cleanup(cleanup_charp))) = NULL;
> @@ -862,7 +842,7 @@ int resize_map(struct multipath *mpp, unsigned long long size,
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_resize(void *v, char **reply, int *len, void *data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -927,7 +907,7 @@ cli_resize(void *v, char **reply, int *len, void *data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_force_no_daemon_q(void * v, char ** reply, int * len, void * data)
>  {
>  	struct config *conf;
> @@ -940,7 +920,7 @@ cli_force_no_daemon_q(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_restore_no_daemon_q(void * v, char ** reply, int * len, void * data)
>  {
>  	struct config *conf;
> @@ -953,7 +933,7 @@ cli_restore_no_daemon_q(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_restore_queueing(void *v, char **reply, int *len, void *data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -994,7 +974,7 @@ cli_restore_queueing(void *v, char **reply, int *len, void *data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_restore_all_queueing(void *v, char **reply, int *len, void *data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1016,7 +996,7 @@ cli_restore_all_queueing(void *v, char **reply, int *len, void *data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_disable_queueing(void *v, char **reply, int *len, void *data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1045,7 +1025,7 @@ cli_disable_queueing(void *v, char **reply, int *len, void *data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_disable_all_queueing(void *v, char **reply, int *len, void *data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1064,7 +1044,7 @@ cli_disable_all_queueing(void *v, char **reply, int *len, void *data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_switch_group(void * v, char ** reply, int * len, void * data)
>  {
>  	char * mapname = get_keyparam(v, MAP);
> @@ -1076,7 +1056,7 @@ cli_switch_group(void * v, char ** reply, int * len, void * data)
>  	return dm_switchgroup(mapname, groupnum);
>  }
>  
> -int
> +static int
>  cli_reconfigure(void * v, char ** reply, int * len, void * data)
>  {
>  	condlog(2, "reconfigure (operator)");
> @@ -1085,7 +1065,7 @@ cli_reconfigure(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_suspend(void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1115,7 +1095,7 @@ cli_suspend(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_resume(void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1147,7 +1127,7 @@ cli_resume(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_reinstate(void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1170,7 +1150,7 @@ cli_reinstate(void * v, char ** reply, int * len, void * data)
>  	return dm_reinstate_path(pp->mpp->alias, pp->dev_t);
>  }
>  
> -int
> +static int
>  cli_reassign (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1194,7 +1174,7 @@ cli_reassign (void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_fail(void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1223,7 +1203,7 @@ cli_fail(void * v, char ** reply, int * len, void * data)
>  	return r;
>  }
>  
> -int
> +static int
>  show_blacklist (char ** r, int * len)
>  {
>  	STRBUF_ON_STACK(reply);
> @@ -1243,7 +1223,7 @@ show_blacklist (char ** r, int * len)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_list_blacklist (void * v, char ** reply, int * len, void * data)
>  {
>  	condlog(3, "list blacklist (operator)");
> @@ -1251,7 +1231,7 @@ cli_list_blacklist (void * v, char ** reply, int * len, void * data)
>  	return show_blacklist(reply, len);
>  }
>  
> -int
> +static int
>  show_devices (char ** r, int * len, struct vectors *vecs)
>  {
>  	STRBUF_ON_STACK(reply);
> @@ -1272,7 +1252,7 @@ show_devices (char ** r, int * len, struct vectors *vecs)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_list_devices (void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
> @@ -1282,13 +1262,13 @@ cli_list_devices (void * v, char ** reply, int * len, void * data)
>  	return show_devices(reply, len, vecs);
>  }
>  
> -int
> +static int
>  cli_quit (void * v, char ** reply, int * len, void * data)
>  {
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_shutdown (void * v, char ** reply, int * len, void * data)
>  {
>  	condlog(3, "shutdown (operator)");
> @@ -1296,7 +1276,7 @@ cli_shutdown (void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_getprstatus (void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -1321,7 +1301,7 @@ cli_getprstatus (void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_setprstatus(void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -1344,7 +1324,7 @@ cli_setprstatus(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_unsetprstatus(void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -1366,7 +1346,7 @@ cli_unsetprstatus(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_getprkey(void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -1398,7 +1378,7 @@ cli_getprkey(void * v, char ** reply, int * len, void * data)
>  	return 0;
>  }
>  
> -int
> +static int
>  cli_unsetprkey(void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -1422,7 +1402,7 @@ cli_unsetprkey(void * v, char ** reply, int * len, void * data)
>  	return ret;
>  }
>  
> -int
> +static int
>  cli_setprkey(void * v, char ** reply, int * len, void * data)
>  {
>  	struct multipath * mpp;
> @@ -1454,7 +1434,7 @@ cli_setprkey(void * v, char ** reply, int * len, void * data)
>  	return ret;
>  }
>  
> -int cli_set_marginal(void * v, char ** reply, int * len, void * data)
> +static int cli_set_marginal(void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
>  	char * param = get_keyparam(v, PATH);
> @@ -1481,7 +1461,7 @@ int cli_set_marginal(void * v, char ** reply, int * len, void * data)
>  	return reload_and_sync_map(pp->mpp, vecs, 0);
>  }
>  
> -int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
> +static int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
>  	char * param = get_keyparam(v, PATH);
> @@ -1508,7 +1488,7 @@ int cli_unset_marginal(void * v, char ** reply, int * len, void * data)
>  	return reload_and_sync_map(pp->mpp, vecs, 0);
>  }
>  
> -int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
> +static int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
>  {
>  	struct vectors * vecs = (struct vectors *)data;
>  	char * mapname = get_keyparam(v, MAP);
> @@ -1544,3 +1524,63 @@ int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data)
>  
>  	return reload_and_sync_map(mpp, vecs, 0);
>  }
> +
> +void init_handler_callbacks(void)
> +{
> +	set_handler_callback(LIST+PATHS, cli_list_paths);
> +	set_handler_callback(LIST+PATHS+FMT, cli_list_paths_fmt);
> +	set_handler_callback(LIST+PATHS+RAW+FMT, cli_list_paths_raw);
> +	set_handler_callback(LIST+PATH, cli_list_path);
> +	set_handler_callback(LIST+MAPS, cli_list_maps);
> +	set_handler_callback(LIST+STATUS, cli_list_status);
> +	set_unlocked_handler_callback(LIST+DAEMON, cli_list_daemon);
> +	set_handler_callback(LIST+MAPS+STATUS, cli_list_maps_status);
> +	set_handler_callback(LIST+MAPS+STATS, cli_list_maps_stats);
> +	set_handler_callback(LIST+MAPS+FMT, cli_list_maps_fmt);
> +	set_handler_callback(LIST+MAPS+RAW+FMT, cli_list_maps_raw);
> +	set_handler_callback(LIST+MAPS+TOPOLOGY, cli_list_maps_topology);
> +	set_handler_callback(LIST+TOPOLOGY, cli_list_maps_topology);
> +	set_handler_callback(LIST+MAPS+JSON, cli_list_maps_json);
> +	set_handler_callback(LIST+MAP+TOPOLOGY, cli_list_map_topology);
> +	set_handler_callback(LIST+MAP+FMT, cli_list_map_fmt);
> +	set_handler_callback(LIST+MAP+RAW+FMT, cli_list_map_fmt);
> +	set_handler_callback(LIST+MAP+JSON, cli_list_map_json);
> +	set_handler_callback(LIST+CONFIG+LOCAL, cli_list_config_local);
> +	set_handler_callback(LIST+CONFIG, cli_list_config);
> +	set_handler_callback(LIST+BLACKLIST, cli_list_blacklist);
> +	set_handler_callback(LIST+DEVICES, cli_list_devices);
> +	set_handler_callback(LIST+WILDCARDS, cli_list_wildcards);
> +	set_handler_callback(RESET+MAPS+STATS, cli_reset_maps_stats);
> +	set_handler_callback(RESET+MAP+STATS, cli_reset_map_stats);
> +	set_handler_callback(ADD+PATH, cli_add_path);
> +	set_handler_callback(DEL+PATH, cli_del_path);
> +	set_handler_callback(ADD+MAP, cli_add_map);
> +	set_handler_callback(DEL+MAP, cli_del_map);
> +	set_handler_callback(DEL+MAPS, cli_del_maps);
> +	set_handler_callback(SWITCH+MAP+GROUP, cli_switch_group);
> +	set_unlocked_handler_callback(RECONFIGURE, cli_reconfigure);
> +	set_handler_callback(SUSPEND+MAP, cli_suspend);
> +	set_handler_callback(RESUME+MAP, cli_resume);
> +	set_handler_callback(RESIZE+MAP, cli_resize);
> +	set_handler_callback(RELOAD+MAP, cli_reload);
> +	set_handler_callback(RESET+MAP, cli_reassign);
> +	set_handler_callback(REINSTATE+PATH, cli_reinstate);
> +	set_handler_callback(FAIL+PATH, cli_fail);
> +	set_handler_callback(DISABLEQ+MAP, cli_disable_queueing);
> +	set_handler_callback(RESTOREQ+MAP, cli_restore_queueing);
> +	set_handler_callback(DISABLEQ+MAPS, cli_disable_all_queueing);
> +	set_handler_callback(RESTOREQ+MAPS, cli_restore_all_queueing);
> +	set_unlocked_handler_callback(QUIT, cli_quit);
> +	set_unlocked_handler_callback(SHUTDOWN, cli_shutdown);
> +	set_handler_callback(GETPRSTATUS+MAP, cli_getprstatus);
> +	set_handler_callback(SETPRSTATUS+MAP, cli_setprstatus);
> +	set_handler_callback(UNSETPRSTATUS+MAP, cli_unsetprstatus);
> +	set_handler_callback(FORCEQ+DAEMON, cli_force_no_daemon_q);
> +	set_handler_callback(RESTOREQ+DAEMON, cli_restore_no_daemon_q);
> +	set_handler_callback(GETPRKEY+MAP, cli_getprkey);
> +	set_handler_callback(SETPRKEY+MAP+KEY, cli_setprkey);
> +	set_handler_callback(UNSETPRKEY+MAP, cli_unsetprkey);
> +	set_handler_callback(SETMARGINAL+PATH, cli_set_marginal);
> +	set_handler_callback(UNSETMARGINAL+PATH, cli_unset_marginal);
> +	set_handler_callback(UNSETMARGINAL+MAP, cli_unset_all_marginal);
> +}
> diff --git a/multipathd/cli_handlers.h b/multipathd/cli_handlers.h
> index 6f57b42..7eaf847 100644
> --- a/multipathd/cli_handlers.h
> +++ b/multipathd/cli_handlers.h
> @@ -1,55 +1,6 @@
> -int cli_list_paths (void * v, char ** reply, int * len, void * data);
> -int cli_list_paths_fmt (void * v, char ** reply, int * len, void * data);
> -int cli_list_paths_raw (void * v, char ** reply, int * len, void * data);
> -int cli_list_path (void * v, char ** reply, int * len, void * data);
> -int cli_list_status (void * v, char ** reply, int * len, void * data);
> -int cli_list_daemon (void * v, char ** reply, int * len, void * data);
> -int cli_list_maps (void * v, char ** reply, int * len, void * data);
> -int cli_list_maps_fmt (void * v, char ** reply, int * len, void * data);
> -int cli_list_maps_raw (void * v, char ** reply, int * len, void * data);
> -int cli_list_map_fmt (void * v, char ** reply, int * len, void * data);
> -int cli_list_map_raw (void * v, char ** reply, int * len, void * data);
> -int cli_list_maps_status (void * v, char ** reply, int * len, void * data);
> -int cli_list_maps_stats (void * v, char ** reply, int * len, void * data);
> -int cli_list_map_topology (void * v, char ** reply, int * len, void * data);
> -int cli_list_maps_topology (void * v, char ** reply, int * len, void * data);
> -int cli_list_map_json (void * v, char ** reply, int * len, void * data);
> -int cli_list_maps_json (void * v, char ** reply, int * len, void * data);
> -int cli_list_config (void * v, char ** reply, int * len, void * data);
> -int cli_list_config_local (void * v, char ** reply, int * len, void * data);
> -int cli_list_blacklist (void * v, char ** reply, int * len, void * data);
> -int cli_list_devices (void * v, char ** reply, int * len, void * data);
> -int cli_list_wildcards (void * v, char ** reply, int * len, void * data);
> -int cli_reset_maps_stats (void * v, char ** reply, int * len, void * data);
> -int cli_reset_map_stats (void * v, char ** reply, int * len, void * data);
> -int cli_add_path (void * v, char ** reply, int * len, void * data);
> -int cli_del_path (void * v, char ** reply, int * len, void * data);
> -int cli_add_map (void * v, char ** reply, int * len, void * data);
> -int cli_del_map (void * v, char ** reply, int * len, void * data);
> -int cli_del_maps (void * v, char ** reply, int * len, void * data);
> -int cli_switch_group(void * v, char ** reply, int * len, void * data);
> -int cli_reconfigure(void * v, char ** reply, int * len, void * data);
> -int cli_resize(void * v, char ** reply, int * len, void * data);
> -int cli_reload(void * v, char ** reply, int * len, void * data);
> -int cli_disable_queueing(void * v, char ** reply, int * len, void * data);
> -int cli_disable_all_queueing(void * v, char ** reply, int * len, void * data);
> -int cli_restore_queueing(void * v, char ** reply, int * len, void * data);
> -int cli_restore_all_queueing(void * v, char ** reply, int * len, void * data);
> -int cli_suspend(void * v, char ** reply, int * len, void * data);
> -int cli_resume(void * v, char ** reply, int * len, void * data);
> -int cli_reinstate(void * v, char ** reply, int * len, void * data);
> -int cli_fail(void * v, char ** reply, int * len, void * data);
> -int cli_force_no_daemon_q(void * v, char ** reply, int * len, void * data);
> -int cli_restore_no_daemon_q(void * v, char ** reply, int * len, void * data);
> -int cli_quit(void * v, char ** reply, int * len, void * data);
> -int cli_shutdown(void * v, char ** reply, int * len, void * data);
> -int cli_reassign (void * v, char ** reply, int * len, void * data);
> -int cli_getprstatus(void * v, char ** reply, int * len, void * data);
> -int cli_setprstatus(void * v, char ** reply, int * len, void * data);
> -int cli_unsetprstatus(void * v, char ** reply, int * len, void * data);
> -int cli_getprkey(void * v, char ** reply, int * len, void * data);
> -int cli_setprkey(void * v, char ** reply, int * len, void * data);
> -int cli_unsetprkey(void * v, char ** reply, int * len, void * data);
> -int cli_set_marginal(void * v, char ** reply, int * len, void * data);
> -int cli_unset_marginal(void * v, char ** reply, int * len, void * data);
> -int cli_unset_all_marginal(void * v, char ** reply, int * len, void * data);
> +#ifndef _CLI_HANDLERS_H
> +#define _CLI_HANDLERS_H
> +
> +void init_handler_callbacks(void);
> +
> +#endif
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 5fb6989..bda51c9 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -1693,63 +1693,7 @@ uxlsnrloop (void * ap)
>  	/* Tell main thread that thread has started */
>  	post_config_state(DAEMON_CONFIGURE);
>  
> -	set_handler_callback(LIST+PATHS, cli_list_paths);
> -	set_handler_callback(LIST+PATHS+FMT, cli_list_paths_fmt);
> -	set_handler_callback(LIST+PATHS+RAW+FMT, cli_list_paths_raw);
> -	set_handler_callback(LIST+PATH, cli_list_path);
> -	set_handler_callback(LIST+MAPS, cli_list_maps);
> -	set_handler_callback(LIST+STATUS, cli_list_status);
> -	set_unlocked_handler_callback(LIST+DAEMON, cli_list_daemon);
> -	set_handler_callback(LIST+MAPS+STATUS, cli_list_maps_status);
> -	set_handler_callback(LIST+MAPS+STATS, cli_list_maps_stats);
> -	set_handler_callback(LIST+MAPS+FMT, cli_list_maps_fmt);
> -	set_handler_callback(LIST+MAPS+RAW+FMT, cli_list_maps_raw);
> -	set_handler_callback(LIST+MAPS+TOPOLOGY, cli_list_maps_topology);
> -	set_handler_callback(LIST+TOPOLOGY, cli_list_maps_topology);
> -	set_handler_callback(LIST+MAPS+JSON, cli_list_maps_json);
> -	set_handler_callback(LIST+MAP+TOPOLOGY, cli_list_map_topology);
> -	set_handler_callback(LIST+MAP+FMT, cli_list_map_fmt);
> -	set_handler_callback(LIST+MAP+RAW+FMT, cli_list_map_fmt);
> -	set_handler_callback(LIST+MAP+JSON, cli_list_map_json);
> -	set_handler_callback(LIST+CONFIG+LOCAL, cli_list_config_local);
> -	set_handler_callback(LIST+CONFIG, cli_list_config);
> -	set_handler_callback(LIST+BLACKLIST, cli_list_blacklist);
> -	set_handler_callback(LIST+DEVICES, cli_list_devices);
> -	set_handler_callback(LIST+WILDCARDS, cli_list_wildcards);
> -	set_handler_callback(RESET+MAPS+STATS, cli_reset_maps_stats);
> -	set_handler_callback(RESET+MAP+STATS, cli_reset_map_stats);
> -	set_handler_callback(ADD+PATH, cli_add_path);
> -	set_handler_callback(DEL+PATH, cli_del_path);
> -	set_handler_callback(ADD+MAP, cli_add_map);
> -	set_handler_callback(DEL+MAP, cli_del_map);
> -	set_handler_callback(DEL+MAPS, cli_del_maps);
> -	set_handler_callback(SWITCH+MAP+GROUP, cli_switch_group);
> -	set_unlocked_handler_callback(RECONFIGURE, cli_reconfigure);
> -	set_handler_callback(SUSPEND+MAP, cli_suspend);
> -	set_handler_callback(RESUME+MAP, cli_resume);
> -	set_handler_callback(RESIZE+MAP, cli_resize);
> -	set_handler_callback(RELOAD+MAP, cli_reload);
> -	set_handler_callback(RESET+MAP, cli_reassign);
> -	set_handler_callback(REINSTATE+PATH, cli_reinstate);
> -	set_handler_callback(FAIL+PATH, cli_fail);
> -	set_handler_callback(DISABLEQ+MAP, cli_disable_queueing);
> -	set_handler_callback(RESTOREQ+MAP, cli_restore_queueing);
> -	set_handler_callback(DISABLEQ+MAPS, cli_disable_all_queueing);
> -	set_handler_callback(RESTOREQ+MAPS, cli_restore_all_queueing);
> -	set_unlocked_handler_callback(QUIT, cli_quit);
> -	set_unlocked_handler_callback(SHUTDOWN, cli_shutdown);
> -	set_handler_callback(GETPRSTATUS+MAP, cli_getprstatus);
> -	set_handler_callback(SETPRSTATUS+MAP, cli_setprstatus);
> -	set_handler_callback(UNSETPRSTATUS+MAP, cli_unsetprstatus);
> -	set_handler_callback(FORCEQ+DAEMON, cli_force_no_daemon_q);
> -	set_handler_callback(RESTOREQ+DAEMON, cli_restore_no_daemon_q);
> -	set_handler_callback(GETPRKEY+MAP, cli_getprkey);
> -	set_handler_callback(SETPRKEY+MAP+KEY, cli_setprkey);
> -	set_handler_callback(UNSETPRKEY+MAP, cli_unsetprkey);
> -	set_handler_callback(SETMARGINAL+PATH, cli_set_marginal);
> -	set_handler_callback(UNSETMARGINAL+PATH, cli_unset_marginal);
> -	set_handler_callback(UNSETMARGINAL+MAP, cli_unset_all_marginal);
> -
> +	init_handler_callbacks();
>  	umask(077);
>  	uxsock_listen(&uxsock_trigger, ux_sock, ap);
>  
> -- 
> 2.33.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

