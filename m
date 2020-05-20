Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 18C2B1DC2F2
	for <lists+dm-devel@lfdr.de>; Thu, 21 May 2020 01:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590017235;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KQ3vKPhS2MXPNBeDn5IIqnIW+DyJPRnglYgMgPN2+78=;
	b=A7uPx/DmjyUn7IZLHwIbI1Ag2QM/s+K0XaoixKA7iOH4cpwyqLhXLPEybDJg9V3KJR+YSa
	0GXB21ExxLbgFR0IPRoj/Vo7xIITqSbgJRM2tzDpgr4rgzTbl3p03iW3JOT78jj3lYo8Fr
	GoyD9TTeZu6Jk1gguR3CO3R+E5Hrh9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-faBYY3xqN6W6G3D4E_ozRw-1; Wed, 20 May 2020 19:27:13 -0400
X-MC-Unique: faBYY3xqN6W6G3D4E_ozRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 936D6107ACCA;
	Wed, 20 May 2020 23:27:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06C1382A1B;
	Wed, 20 May 2020 23:27:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C1C51809543;
	Wed, 20 May 2020 23:26:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KNQcB1010719 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 19:26:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEA3DD0B36; Wed, 20 May 2020 23:26:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9E44D29E6
	for <dm-devel@redhat.com>; Wed, 20 May 2020 23:26:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0280B8007D0
	for <dm-devel@redhat.com>; Wed, 20 May 2020 23:26:36 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-172-sZlK1lW4PAGBLGyPpLm-9A-1; Wed, 20 May 2020 19:26:31 -0400
X-MC-Unique: sZlK1lW4PAGBLGyPpLm-9A-1
Received: by mail-wr1-f67.google.com with SMTP id l17so4871638wrr.4;
	Wed, 20 May 2020 16:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XQj0KuafA6rqxjjwjiH0uiqBGMfrXq9B8u6LHiRahoY=;
	b=sg9GQ4ZtPyiALdrBw8rC/tUm5LFjZ6eg4c/QEQhgKIpnB0BUUBlrJoGBUjCh9kMXyU
	raXgJXrbJ7SBk11U4sga6wsVQZsOD19W34NsqK4qBwVzTj3uZPfK0CVIHqyfc33eZNF7
	j+jcIfXXP5LO6QyhxHXtd1kPhRlP+lGewjLXFaGygPOEfa+84/42mJq5AAZW12wNEdRv
	G9Y0WxikKLyd/VIil8C1kgW628ltQu3Leun06YPoMS0ZTwm2Tq2kFUmFbNJZiFtrLWRM
	e2SIt/6agelFd7uUlg7Lhu39cwS3TOkAPpvkNGLyaBgXrKick86vlDaS/Pl9yBerlSrc
	wFbw==
X-Gm-Message-State: AOAM533DlA59YoeatTR+Cf+VSf4VIRQ2IdRZqt9GlZ9T2YnR9rlQuHaW
	I+2q2Ue1q457eZlZZTTW/A==
X-Google-Smtp-Source: ABdhPJwS0Oc08++7oTKH4IYWa8YQ4ljm/jdHQ4MxgGfEuLFVwJLFyp9sloQn8AlZ3oJWGJPYc/4+nA==
X-Received: by 2002:adf:f5c4:: with SMTP id k4mr5707115wrp.23.1590017189567;
	Wed, 20 May 2020 16:26:29 -0700 (PDT)
Received: from localhost (42.red-83-37-136.dynamicip.rima-tde.net.
	[83.37.136.42])
	by smtp.gmail.com with ESMTPSA id u7sm4398657wmm.8.2020.05.20.16.26.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 20 May 2020 16:26:29 -0700 (PDT)
To: Gabriel Krisman Bertazi <krisman@collabora.com>, agk@redhat.com,
	snitzer@redhat.com
References: <20200511163910.3778467-1-krisman@collabora.com>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <ee987451-6d17-b978-809e-e0fe56dc13ce@gmail.com>
Date: Thu, 21 May 2020 01:26:27 +0200
MIME-Version: 1.0
In-Reply-To: <20200511163910.3778467-1-krisman@collabora.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: breeves@redhat.com, linux-kernel@vger.kernel.org, khazhy@google.com,
	song@kernel.org, dm-devel@redhat.com, mpatocka@redhat.com,
	kernel@collabora.com
Subject: Re: [dm-devel] [PATCH v4 0/2] Historical Service Time Path Selector
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 5/11/20 6:39 PM, Gabriel Krisman Bertazi wrote:

> This fourth version of HST applies the suggestion from Mikulas Patocka
> to do the ktime_get_ns inside the mpath map_bio instead of generic
> device-mapper code. This means that struct dm_mpath_io gained another
> 64bit field.  For the request-based case, we continue to use the block
> layer start time information.

You should add some info to the multipath.conf.5 man page ( 
https://git.opensvc.com/gitweb.cgi?p=multipath-tools/.git;a=blob;f=multipath/multipath.conf.5;h=05a5e8ffeb110d969f3b2381eb3b88d7f28380f6;hb=HEAD#l189 ),
or none one is going to use it.


Thanks.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

