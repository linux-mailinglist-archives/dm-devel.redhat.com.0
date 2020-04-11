Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 75E841A73AF
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DK8ltt7dSJNMtJh5zPNlhjad8FVt1WnvOm6BsBt67fU=;
	b=VuYwqqSfS294V8lToUrtiyOfVrZOZUjI6kbjLYcjPoC+sNxBO7kJoK3TbCJDp8ud65LUaz
	d5uOdXBq47hGSpZGAebd5Ry72bxmQwc02bw6tFnRWh2G7CD/EYM7mXgDNoev4v58zTX051
	sW3FJfdldYvaIIXdLmH07paoNyLrnNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-_L5ILCUFMaypiYfHWWmvlA-1; Tue, 14 Apr 2020 02:29:45 -0400
X-MC-Unique: _L5ILCUFMaypiYfHWWmvlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2DFF107ACC9;
	Tue, 14 Apr 2020 06:29:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 517851000325;
	Tue, 14 Apr 2020 06:29:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 602DA18089CD;
	Tue, 14 Apr 2020 06:29:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03BCUJPS001061 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 11 Apr 2020 08:30:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B62C42093CC3; Sat, 11 Apr 2020 12:30:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1C182028DCB
	for <dm-devel@redhat.com>; Sat, 11 Apr 2020 12:30:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F73B80028B
	for <dm-devel@redhat.com>; Sat, 11 Apr 2020 12:30:17 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-351-e4PqzQ9DPC6FC8thYrX3hA-1; Sat, 11 Apr 2020 08:30:15 -0400
X-MC-Unique: e4PqzQ9DPC6FC8thYrX3hA-1
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03BCTa8U117307; Sat, 11 Apr 2020 12:30:13 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2130.oracle.com with ESMTP id 30b5aqrwuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Apr 2020 12:30:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	03BCRXCh058180; Sat, 11 Apr 2020 12:30:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by userp3030.oracle.com with ESMTP id 30b30st2dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Apr 2020 12:30:13 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 03BCUCrc001660;
	Sat, 11 Apr 2020 12:30:12 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Sat, 11 Apr 2020 05:30:11 -0700
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
References: <20200409064527.82992-1-hare@suse.de>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <4052464c-cf93-3e22-3050-58183b9ae564@oracle.com>
Date: Sat, 11 Apr 2020 20:30:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20200409064527.82992-1-hare@suse.de>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9587
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
	mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004110117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9587
	signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
	impostorscore=0
	clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
	spamscore=0
	mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0
	lowpriorityscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2003020000 definitions=main-2004110117
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 02:29:25 -0400
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCHv3 00/11] dm-zoned: metadata version 2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 4/9/20 2:45 PM, Hannes Reinecke wrote:
> Hi all,
> 
> this patchset adds a new metadata version 2, which brings the following
> improvements:
> - UUIDs and labels: Adding three more fields to the metadata containing
>   the dm-zoned device UUID and label, and the device UUID. This allows
>   for an unique identification of the devices, so that several dm-zoned
>   sets can coexist and have a persistent identification.
> - Extend random zones by an additional regular disk device: A regular
>   block device can be added together with the zoned block device, providing
>   additional (emulated) random write zones. With this it's possible to
>   handle sequential zones only devices; also there will be a speed-up if
>   the regular block device resides on a fast medium. The regular block device
>   is placed logically in front of the zoned block device, so that metadata
>   and mapping tables reside on the regular block device, not the zoned device.
> - Tertiary superblock support: In addition to the two existing sets of metadata
>   another, tertiary, superblock is written to the first block of the zoned
>   block device. This superblock is for identification only; the generation
>   number is set to '0' and the block itself it never updated. The additional
>   metadate like bitmap tables etc are not copied.
> 
> To handle this, some changes to the original handling are introduced:
> - Zones are now equidistant. Originally, runt zones were ignored, and
>   not counted when sizing the mapping tables. With the dual device setup
>   runt zones might occur at the end of the regular block device, making
>   direct translation between zone number and sector/block number complex.
>   For metadata version 2 all zones are considered to be of the same size,
>   and runt zones are simply marked as 'offline' to have them ignored when
>   allocating a new zone.
> - The block number in the superblock is now the global number, and refers to
>   the location of the superblock relative to the resulting device-mapper
>   device. Which means that the tertiary superblock contains absolute block
>   addresses, which needs to be translated to the relative device addresses
>   to find the referenced block.
> 
> There is an accompanying patchset for dm-zoned-tools for writing and checking
> this new metadata.
> 
> As usual, comments and reviews are welcome.
> 
> Changes to v2:
> - Kill dmz_id()
> - Include reviews from Damien
> - Sanitize uuid handling as suggested by John Dorminy
> 

This series looks good to me, feel free to add my
Reviewed-by: Bob Liu <bob.liu@oracle.com>

By the way, have you completed the patches for regular device support?
I was considering rebase my previous patches to this series but not sure is it still necessary.

Regards,
Bob

> Hannes Reinecke (11):
>   dm-zoned: store zone id within the zone structure and kill dmz_id()
>   dm-zoned: use array for superblock zones
>   dm-zoned: store device in struct dmz_sb
>   dm-zoned: move fields from struct dmz_dev to dmz_metadata
>   dm-zoned: introduce dmz_metadata_label() to format device name
>   dm-zoned: remove 'dev' argument from reclaim
>   dm-zoned: replace 'target' pointer in the bio context
>   dm-zoned: use dmz_zone_to_dev() when handling metadata I/O
>   dm-zoned: add metadata logging functions
>   dm-zoned: ignore metadata zone in dmz_alloc_zone()
>   dm-zoned: metadata version 2
> 
>  drivers/md/dm-zoned-metadata.c | 601 ++++++++++++++++++++++++---------
>  drivers/md/dm-zoned-reclaim.c  |  89 ++---
>  drivers/md/dm-zoned-target.c   | 273 ++++++++-------
>  drivers/md/dm-zoned.h          |  29 +-
>  4 files changed, 659 insertions(+), 333 deletions(-)
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

