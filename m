Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B17AFF58
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 16:56:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0FA3E10F2E87;
	Wed, 11 Sep 2019 14:56:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09BD619C58;
	Wed, 11 Sep 2019 14:56:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8293180B536;
	Wed, 11 Sep 2019 14:56:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BEsYU9007475 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 10:54:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31CAA5D717; Wed, 11 Sep 2019 14:54:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2915B5D6A9;
	Wed, 11 Sep 2019 14:54:31 +0000 (UTC)
Date: Wed, 11 Sep 2019 10:54:30 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <20190911145430.GA32491@redhat.com>
References: <20190906142656.5338-1-ntsironis@arrikto.com>
	<e9c47ee3-efc8-e492-9a3d-9c4419601168@arrikto.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9c47ee3-efc8-e492-9a3d-9c4419601168@arrikto.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, dm-devel@redhat.com, agk@redhat.com,
	iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH v2 0/1] dm: add clone target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Wed, 11 Sep 2019 14:56:49 +0000 (UTC)

On Wed, Sep 11 2019 at 10:41am -0400,
Nikos Tsironis <ntsironis@arrikto.com> wrote:

> Hi Mike,
> 
> I just noticed commit 6cf2a73cb2bc42 ("docs: device-mapper: move it to
> the admin-guide"), which moves Documentation/device-mapper/ to
> Documentation/admin-guide/device-mapper/.
> 
> I sent a v3 which moves dm-clone.rst under
> Documentation/admin-guide/device-mapper/.
> 
> Sorry for that,
> Nikos.

Absolutely fine, nice catch, I've staged v3 for 5.4.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
