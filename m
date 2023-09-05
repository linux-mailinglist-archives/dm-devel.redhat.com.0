Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AB1793127
	for <lists+dm-devel@lfdr.de>; Tue,  5 Sep 2023 23:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693950280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bbNtpy8S+PBWmMCoLc6WKxB9PLma+SAgh8Qw4ptUFsA=;
	b=IZh7TMIJdyBfgrjUGkP+bGFtMVH9YWGEkoY/F8WZcuqCtGKBr++EM7UFrrdZDLghPKzyGA
	UdWEQGcsUxbvlFDzZZwBUfuFkt5gC+e+A/HpbvZlvtS5Z/H8PvFpF1u0LqJWy9zp0hXQtR
	+P0xJahHSSodPZzRjWQkpoUfHPyDIDM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-e7X_YLf6M6qEeuU_fzPkEA-1; Tue, 05 Sep 2023 17:44:36 -0400
X-MC-Unique: e7X_YLf6M6qEeuU_fzPkEA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0468938117FB;
	Tue,  5 Sep 2023 21:44:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A209C46F523;
	Tue,  5 Sep 2023 21:44:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 531FE19465BC;
	Tue,  5 Sep 2023 21:44:23 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 196001946589
 for <dm-devel@listman.corp.redhat.com>; Tue,  5 Sep 2023 21:44:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CAB1F140E963; Tue,  5 Sep 2023 21:44:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B05BF140E950;
 Tue,  5 Sep 2023 21:44:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 385LiD8C023444;
 Tue, 5 Sep 2023 16:44:13 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 385LiCAW023443;
 Tue, 5 Sep 2023 16:44:12 -0500
Date: Tue, 5 Sep 2023 16:44:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20230905214412.GK7412@octiron.msp.redhat.com>
References: <20230901212439.11880-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20230901212439.11880-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] [PATCH] Fix hwtable test after "libmultipath: don't
 bother to recheck timeout"
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 01, 2023 at 11:24:39PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> The previous patch  "libmultipath: don't bother to recheck timeout"
> causes sysfs_get_timeout() to be called less frequently. Adapt the
> tests.
> 
Oops.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  tests/test-lib.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/tests/test-lib.c b/tests/test-lib.c
> index 0bc49d5..f75ea31 100644
> --- a/tests/test-lib.c
> +++ b/tests/test-lib.c
> @@ -342,12 +342,6 @@ void mock_pathinfo(int mask, const struct mocked_path *mp)
>  			    mp->wwid);
>  	}
>  
> -	if (mask & DI_CHECKER) {
> -		/* get_state -> sysfs_get_timeout  */
> -		will_return(__wrap_udev_device_get_subsystem, "scsi");
> -		will_return(__wrap_udev_device_get_sysattr_value, "180");
> -	}
> -
>  	if (mask & DI_PRIO && mp->flags & NEED_SELECT_PRIO) {
>  
>  		/* sysfs_get_timeout, again (!?) */
> -- 
> 2.41.0
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

