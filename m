Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E07E8B0E71
	for <lists+dm-devel@lfdr.de>; Thu, 12 Sep 2019 14:01:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5A1F18C4273;
	Thu, 12 Sep 2019 12:01:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA5E05C207;
	Thu, 12 Sep 2019 12:01:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C0349180B536;
	Thu, 12 Sep 2019 12:01:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8CBx9wU005664 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 12 Sep 2019 07:59:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A9D95D721; Thu, 12 Sep 2019 11:59:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (ovpn-117-201.ams2.redhat.com [10.36.117.201])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE2B15D704;
	Thu, 12 Sep 2019 11:59:01 +0000 (UTC)
To: Mikulas Patocka <mpatocka@redhat.com>, Martijn Coenen <maco@android.com>, 
	Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>
References: <20190912084550.401229120@debian-a64.vm>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <03876828-40a1-7adc-d40c-939853e8259c@redhat.com>
Date: Thu, 12 Sep 2019 13:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912084550.401229120@debian-a64.vm>
Content-Language: en-MW
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: maco@google.com, dariofreni@google.com, jiyong@google.com,
	kernel-team@android.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 5/5] dm-bufio: introduce a global cache
 replacement
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Thu, 12 Sep 2019 12:01:23 +0000 (UTC)

Mikulas,

please use list_move instead of list_del/list_add pairs.

Heinz

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
