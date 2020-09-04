Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E42BD25E2BE
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 22:29:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599251359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KXno6MQ4FaVZMXjPDHJp6EK1amvQSjlGPkiNmXQYBcg=;
	b=Vy3UwNfoYs9GuxtOanpMa4L44/8fVYcHf3oKPUOab9/OJqGN03jTGdbXY6wo3Zd3Cra2KU
	0+QVPZBgl3Wd8D/aGggzBd0iG5gl4OHyDBppnRgJyQPVMeH2O8nREmcqDd4GLz3Qx14v/e
	QrdbD9Zpt0NdkKW5dO1WjLqDzhfQTXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-uDA19S75M9qHmLZL8TH9hw-1; Fri, 04 Sep 2020 16:29:15 -0400
X-MC-Unique: uDA19S75M9qHmLZL8TH9hw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 737F318A2261;
	Fri,  4 Sep 2020 20:29:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD2D87E419;
	Fri,  4 Sep 2020 20:28:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B43318561B2;
	Fri,  4 Sep 2020 20:28:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084KSXoE017417 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 16:28:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8603819D7D; Fri,  4 Sep 2020 20:28:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 563E319C59;
	Fri,  4 Sep 2020 20:28:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 084KSSv7025010; 
	Fri, 4 Sep 2020 15:28:28 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 084KSShS025009;
	Fri, 4 Sep 2020 15:28:28 -0500
Date: Fri, 4 Sep 2020 15:28:27 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200904202827.GC11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<efc49805-8938-00d4-5eff-230f8f6f064e@huawei.com>
MIME-Version: 1.0
In-Reply-To: <efc49805-8938-00d4-5eff-230f8f6f064e@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 07/14] libmultipath: check return value of
 dm_mapname in, sysfs_check_holders
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:19:51PM +0800, lixiaokeng wrote:
> In sysfs_check_holders func, table_name is obtained by calling
> dm_mapname func, and then call dm_reassign_table for reassigning
> table. However, we donnot check whether dm_mapname func returns
> NULL, and then it may cause a segmentation fault in dm_task_set_name.
> 
> Here, we will check whether dm_mapname func returns NULL before
> using it.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> ---
>  libmultipath/sysfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
> index 12a82d95..5390de62 100644
> --- a/libmultipath/sysfs.c
> +++ b/libmultipath/sysfs.c
> @@ -278,7 +278,11 @@ int sysfs_check_holders(char * check_devt, char * new_devt)
>  			continue;
>  		}
>  		table_name = dm_mapname(major, table_minor);
> -
> +		if (!table_name) {
> +			condlog(2, "%s: mapname not found for %d:%d", check_dev,
> +				major, table_minor);
> +			continue;
> +		}
>  		condlog(0, "%s: reassign table %s old %s new %s", check_dev,
>  			table_name, check_devt, new_devt);
> 
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

