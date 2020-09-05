Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 41E0C25E492
	for <lists+dm-devel@lfdr.de>; Sat,  5 Sep 2020 02:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599264886;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sIz7jKX0AqcKxvVUJlX/bVvFPppUAeDfMTajj8qMpXk=;
	b=e9vn6T1V/TOnJrFWuX+iRv9RDfW5HGRvVjnYIG2Me+0owb/JHQ7QHh0XL1NabufOwnRr4i
	VPfragibFjf4DliJ5lnPncxgwafFY02v7rB6BOH46GmQB2/PiBpmMqO66407s+tB+rWJdn
	eAg/k8GDIt2GRiDmjnl7CIWOKM+g5Dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-6ZAsTgC1PfG3MHFS0y_WdQ-1; Fri, 04 Sep 2020 20:14:43 -0400
X-MC-Unique: 6ZAsTgC1PfG3MHFS0y_WdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EDB618A226A;
	Sat,  5 Sep 2020 00:14:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9DD75C1CF;
	Sat,  5 Sep 2020 00:14:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 478B618561B2;
	Sat,  5 Sep 2020 00:14:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0850EUVW011124 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 20:14:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B27D65C74; Sat,  5 Sep 2020 00:14:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 887F87E16F;
	Sat,  5 Sep 2020 00:14:27 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0850EQo5025989; 
	Fri, 4 Sep 2020 19:14:26 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0850EPoq025987;
	Fri, 4 Sep 2020 19:14:25 -0500
Date: Fri, 4 Sep 2020 19:14:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <20200905001425.GJ11108@octiron.msp.redhat.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<829f930f-f426-bcd6-602d-26959accaef7@huawei.com>
MIME-Version: 1.0
In-Reply-To: <829f930f-f426-bcd6-602d-26959accaef7@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	dm-devel mailing list <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 14/14] multipathpersist: delete unused
 variable in handle_args
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 02, 2020 at 03:26:29PM +0800, lixiaokeng wrote:
> In handle_args, the tmp isn't used. We delete it.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> Signed-off-by: Linfeilong <linfeilong@huawei.com>
> ---
>  mpathpersist/main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mpathpersist/main.c b/mpathpersist/main.c
> index f20c902c..ccf0024e 100644
> --- a/mpathpersist/main.c
> +++ b/mpathpersist/main.c
> @@ -213,7 +213,6 @@ static int handle_args(int argc, char * argv[], int nline)
>  	int num_transport =0;
>  	char *batch_fn = NULL;
>  	void *resp = NULL;
> -	struct transportid * tmp;
> 
>  	memset(transportids, 0, MPATH_MX_TIDS * sizeof(struct transportid));
> 
> -- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

