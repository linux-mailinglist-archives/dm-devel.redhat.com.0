Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8174925E48F
	for <lists+dm-devel@lfdr.de>; Sat,  5 Sep 2020 02:11:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599264676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p3h/9c5ioMJcU7xS8Vcta+A/n/HtFpsFaf0BDz7nQOY=;
	b=AGIOsoBOxUMjz0I4nwHEVfWqa5Y5fwxSnHTXBgalcs0pndujZ1xXtGTqIck2x8XrMe1RKV
	a3y+25/icGFig2taoUJxQGoJHEbgtlUURBu1hix8CocrEhgQ17479AOyTB9k8bI53RCzm8
	kSHHJtXP/GwLHwDiaBwInn25APGqpIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-a2j44UHNNXqKDCil8iKLcA-1; Fri, 04 Sep 2020 20:11:13 -0400
X-MC-Unique: a2j44UHNNXqKDCil8iKLcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EAAC87A831;
	Sat,  5 Sep 2020 00:11:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC1027E170;
	Sat,  5 Sep 2020 00:11:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 541B379DBB;
	Sat,  5 Sep 2020 00:11:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0850Avvr010950 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 20:10:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA6015C1D0; Sat,  5 Sep 2020 00:10:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA79E5C1CF;
	Sat,  5 Sep 2020 00:10:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0850Arat025976; 
	Fri, 4 Sep 2020 19:10:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0850AqSX025975;
	Fri, 4 Sep 2020 19:10:52 -0500
Date: Fri, 4 Sep 2020 19:10:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200905001052.GI11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<78021dc0-bede-f376-b450-40dd5522786b@huawei.com>
MIME-Version: 1.0
In-Reply-To: <78021dc0-bede-f376-b450-40dd5522786b@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 13/14] multipath: use
 update_multipath_table/status in, check_useable_paths
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:25:28PM +0800, lixiaokeng wrote:
> The return values of dm_get_map, disassemble_map,dm_get_status
> and disassemble_status in check_usable_paths were not checked.
> Use update_multipath_table/status to instead of them.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  multipath/main.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/multipath/main.c b/multipath/main.c
> index d227e0b3..9e920d89 100644
> --- a/multipath/main.c
> +++ b/multipath/main.c
> @@ -251,7 +251,6 @@ static int check_usable_paths(struct config *conf,
>  	struct path *pp;
>  	char *mapname;
>  	vector pathvec = NULL;
> -	char params[PARAMS_SIZE], status[PARAMS_SIZE];
>  	dev_t devt;
>  	int r = 1, i, j;
> 
> @@ -285,11 +284,9 @@ static int check_usable_paths(struct config *conf,
>  	if (mpp == NULL)
>  		goto free;
> 
> -	dm_get_map(mpp->alias, &mpp->size, params);
> -	dm_get_status(mpp->alias, status);
> -	disassemble_map(pathvec, params, mpp);
> -	update_pathvec_from_dm(pathvec, mpp, 0);
> -	disassemble_status(status, mpp);
> +	if (update_multipath_table(mpp, pathvec, 0) != DMP_OK ||
> +		    update_multipath_status(mpp) != DMP_OK)
> +		    goto free;
> 
>  	vector_foreach_slot (mpp->pg, pg, i) {
>  		vector_foreach_slot (pg->paths, pp, j) {
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

