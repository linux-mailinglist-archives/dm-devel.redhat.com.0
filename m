Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5568A25E480
	for <lists+dm-devel@lfdr.de>; Sat,  5 Sep 2020 02:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599264339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6mnwcsGWoDPp9ozq6YWQphxIGm6sNksMrl9VowtAATk=;
	b=e9R6OFb+oAYgvmoHAqdMsUfkQ6/38gxFyE3Ll1jvJdpfWZSe21IzJNTq40ytpipAy0rNz8
	WXIV35cs1FWX+F9MjgB3GWnGfBarVWa/OY7pwgCkEMkSTrlxYngnaCsPsPXfj6qgF+K2V7
	uuOXokViDIXRHtqjS3oBpDyeJgMShJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-J5sNTevCPR2F5K9zOh24tg-1; Fri, 04 Sep 2020 20:05:37 -0400
X-MC-Unique: J5sNTevCPR2F5K9zOh24tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30836107465D;
	Sat,  5 Sep 2020 00:05:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A13ED5D9D2;
	Sat,  5 Sep 2020 00:05:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEAA218561B2;
	Sat,  5 Sep 2020 00:05:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0850582S010565 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 20:05:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC47A5C1D0; Sat,  5 Sep 2020 00:05:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB8D5C1CF;
	Sat,  5 Sep 2020 00:05:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 085052RI025959; 
	Fri, 4 Sep 2020 19:05:02 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 085052K8025958;
	Fri, 4 Sep 2020 19:05:02 -0500
Date: Fri, 4 Sep 2020 19:05:01 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200905000501.GH11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<5beca982-98a1-e48b-f86f-95810bc3c49c@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5beca982-98a1-e48b-f86f-95810bc3c49c@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 12/14] libmultipathpersist: use
 update_multipath_table/status, in get_mpvec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:24:33PM +0800, lixiaokeng wrote:
> The return values of dm_get_map, disassemble_map in get_mpvec
> were not checked. Use update_multipath_table/status to instead
> of them.
> 

Looks mostly good. I agree that we should be checking the results of
getting the raw data before we try to disassemble it. But, there's not
really any point to calling continue as the last operation of a loop.
Perhaps

if (update_multipath_table(mpp, pathvec, DI_CHECKER) == DMP_OK)
	update_multipath_status(mpp);

makes more sense.

> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  libmpathpersist/mpath_persist.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
> index e7256049..046fda21 100644
> --- a/libmpathpersist/mpath_persist.c
> +++ b/libmpathpersist/mpath_persist.c
> @@ -323,7 +323,6 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
>  {
>  	int i;
>  	struct multipath *mpp;
> -	char params[PARAMS_SIZE], status[PARAMS_SIZE];
> 
>  	vector_foreach_slot (curmp, mpp, i){
>  		/*
> @@ -341,13 +340,9 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
>  		if (refwwid && strncmp (mpp->alias, refwwid, WWID_SIZE - 1))
>  			continue;
> 
> -		dm_get_map(mpp->alias, &mpp->size, params);
> -		condlog(3, "params = %s", params);
> -		dm_get_status(mpp->alias, status);
> -		condlog(3, "status = %s", status);
> -		disassemble_map (pathvec, params, mpp);
> -		update_pathvec_from_dm(pathvec, mpp, DI_CHECKER);
> -		disassemble_status (status, mpp);
> +		if (update_multipath_table(mpp, pathvec, DI_CHECKER) != DMP_OK ||
> +		    update_multipath_status(mpp) != DMP_OK)
> +			continue;
> 
>  	}
>  	return MPATH_PR_SUCCESS ;
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

