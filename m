Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4FA2A3BDB80
	for <lists+dm-devel@lfdr.de>; Tue,  6 Jul 2021 18:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625589652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T9nYoZhJ8H0cRQ6HNxE4WFUigkn90beK0f2hu56uxNw=;
	b=e0N7H2MMhsM/MCbop7yqIh4LycZMu9nvM6b+NFVlBooDylonOM/E6f7a/VHdyqTfrU/MqS
	vcbLdZLu8UOtQQ7ADdT5zAD2MotOSDE+1yG3w7Br0RzkRdUvVUDsxcfswd0FQ7e0DazFDw
	KASTpPkaj6gvsD30pxVXtFrArW7tAiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-T8NyBoR0OXG7mvjb7xhbRg-1; Tue, 06 Jul 2021 12:40:50 -0400
X-MC-Unique: T8NyBoR0OXG7mvjb7xhbRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AACC01084F54;
	Tue,  6 Jul 2021 16:40:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 415E85DD68;
	Tue,  6 Jul 2021 16:40:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA2D61809C99;
	Tue,  6 Jul 2021 16:40:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 166Ge9Rx025736 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Jul 2021 12:40:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CEA62141823; Tue,  6 Jul 2021 16:40:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 184372141820
	for <dm-devel@redhat.com>; Tue,  6 Jul 2021 16:40:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A444802E5E
	for <dm-devel@redhat.com>; Tue,  6 Jul 2021 16:40:06 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-596-vFko-q6qO1mD7klZOx9hSg-1; Tue, 06 Jul 2021 12:40:04 -0400
X-MC-Unique: vFko-q6qO1mD7klZOx9hSg-1
Received: by mail-wm1-f71.google.com with SMTP id
	i3-20020a05600c3543b02902075ed92710so1332430wmq.0
	for <dm-devel@redhat.com>; Tue, 06 Jul 2021 09:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=C7aeEiE0261u8W/0alOEA+0ULo/TNVUkzeKthLCdrp4=;
	b=K3kpigMcTqBbu6FZUfoaOEL5bvktmNrccakMVn4a9fv9AbfumGS/5EvQYmJMGO4fYb
	zxQhoK3Qhl5VvKJ5St4x3G7HDW+AIzihd6kChdJr0lX1GZgyezifAHTHsUXWata0gqSi
	ZqTRwf6QSWlAVXWbKLYgCB7O1Qe8otf+1zIk4fnAFW2gqYBnYXKKj7iyBNi6nrFJluxt
	E05ktFYN1r9Q13g2CL9/4Hlt9tYcXvg+Nkev34X5ZLAfgkFkNnluAg6edeRsS59DgTxi
	LXBiq9T/Kzc0j+sjG2EgWsLw7cexu7qYMDXCk7A2OFhpCdvlKLaZaOrg9EuG0QYE8XYo
	TGOw==
X-Gm-Message-State: AOAM532X2uWP7kt4476oeyQo2ibjUGmDEO0Gb7n7C952rijY8RClmMce
	85EI9TwoqMlQEyXydOx/LlZmBuu5taHMq9HMURGHdU6+eEfVtmeGo5cPp0fWA6ZosLw303pM8Ea
	t8GiXNxCqvvnK+FI=
X-Received: by 2002:a05:6000:c7:: with SMTP id
	q7mr23180014wrx.161.1625589603381; 
	Tue, 06 Jul 2021 09:40:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNa8oOAmHc+evx+g5AXkNFehnVgc0Nv+HoZ2GPwmuf0hZx2Q0JR3vf24Nzu8rCgpPOuZ1Thg==
X-Received: by 2002:a05:6000:c7:: with SMTP id
	q7mr23179993wrx.161.1625589603216; 
	Tue, 06 Jul 2021 09:40:03 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
	([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
	by smtp.gmail.com with ESMTPSA id
	z3sm20259622wrv.45.2021.07.06.09.40.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 06 Jul 2021 09:40:02 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
References: <20210628095210.26249-2-mwilck@suse.com>
	<20210628095341.GA4105@lst.de>
	<4fb99309463052355bb8fefe034a320085acab1b.camel@suse.com>
	<20210629125909.GB14372@lst.de>
	<2b5fd35d95668a8cba9151941c058cb8aee3e37c.camel@suse.com>
	<20210629212316.GA3367857@dhcp-10-100-145-180.wdc.com>
	<1aa1f875e7a85f9a331e88e4f8482588176bdb3a.camel@suse.com>
	<YNyVafnX09cOIZPe@redhat.com>
	<da3039c75c892f7d4031161f7c8719e50de36057.camel@suse.com>
	<1c05c65e-64a2-0584-1888-1f544998365e@acm.org>
	<20210701061901.GA22293@lst.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f96bf6c9-d7a3-bfdc-a645-b6b070f9e9cc@redhat.com>
Date: Tue, 6 Jul 2021 18:40:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701061901.GA22293@lst.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, Daniel Wagner <dwagner@suse.de>,
	emilne@redhat.com, linux-block@vger.kernel.org,
	dm-devel@redhat.com, nkoenig@redhat.com, Martin Wilck <mwilck@suse.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 1/3] scsi: scsi_ioctl: export
 __scsi_result_to_blk_status()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On 01/07/21 08:19, Christoph Hellwig wrote:
> http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/scsi-ioctl
> 
> But more importantly, dm has no business interpreting the errors.  Just
> like how SG_IO processing generally does not look at the error and
> just returns it to userspace and leaves error handling to the caller
> so should be the decision to resubmit it in a multi-path setup.

The problem is that userspace does not have a way to direct the command 
to a different path in the resubmission.  It may not even have 
permission to issue DM_TABLE_STATUS, or to access the /dev nodes for the 
underlying paths, so without Martin's patches SG_IO on dm-mpath is 
basically unreliable by design.

Paolo

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

