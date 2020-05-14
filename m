Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8971B1D2510
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 04:20:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589422827;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9ClQMC3yDCgg+2M2pfJHoG6JNS5rMLGChW3wRd2UgaA=;
	b=TlBVjohBjwJsLWj8o9LgshP6N3NGTAZdcTTf9NtJHfbOkFO5uxzJVe26/4PSWlHI0wZpnQ
	q9MG33NI9dvQ4PElRtc0nvPtkl+xdT6vWuyYLqw3CXGTGfQDh0wEUZccPRr3qXnG55RlaO
	jUNtzd3Lc+g4V8wnhETZDHf8jwEh/hc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-MxeJ6N5ZNCiWXPOPB3tk6Q-1; Wed, 13 May 2020 22:20:25 -0400
X-MC-Unique: MxeJ6N5ZNCiWXPOPB3tk6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64D278018A1;
	Thu, 14 May 2020 02:20:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D9BE5C1D6;
	Thu, 14 May 2020 02:20:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0541D1809543;
	Thu, 14 May 2020 02:20:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E2K2o2016433 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 22:20:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E7811155286; Thu, 14 May 2020 02:20:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6DB5120ECE
	for <dm-devel@redhat.com>; Thu, 14 May 2020 02:19:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AE2C186E3A4
	for <dm-devel@redhat.com>; Thu, 14 May 2020 02:19:59 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-238-LS3Dd4pYNCOMLK8fgBWL3g-1; Wed, 13 May 2020 22:19:53 -0400
X-MC-Unique: LS3Dd4pYNCOMLK8fgBWL3g-1
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04E2HDnS007653; Thu, 14 May 2020 02:19:52 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 3100xwquf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 14 May 2020 02:19:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id
	04E2Ic60107294; Thu, 14 May 2020 02:19:51 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 310vjr2pt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 May 2020 02:19:51 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04E2Jo68022302;
	Thu, 14 May 2020 02:19:50 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 13 May 2020 19:19:41 -0700
To: Damien Le Moal <Damien.LeMoal@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
	<BY5PR04MB6900C84D00585D3560D4C51AE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690020AE68E7A20EA8BFED0DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690002ABF208B084607B6971E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<yq13683z7sj.fsf@oracle.com>
	<BY5PR04MB6900B82F4BEE1B13B239D93EE7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
Date: Wed, 13 May 2020 22:19:38 -0400
In-Reply-To: <BY5PR04MB6900B82F4BEE1B13B239D93EE7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
	(Damien Le Moal's message of "Thu, 14 May 2020 00:55:10 +0000")
Message-ID: <yq1h7wjxnph.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9620
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
	bulkscore=0 phishscore=0
	spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
	classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2004280000 definitions=main-2005140018
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9620
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	cotscore=-2147483648 bulkscore=0
	phishscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
	impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
	mlxscore=0
	suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.12.0-2004280000 definitions=main-2005140018
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Bob Liu <bob.liu@oracle.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Damien,

> Indeed. It is an NVMe M.2 consumer grade SSD. Nothing fancy. If you
> look at nvme/host/core.c nvme_update_disk_info(), you will see that
> io_opt is set to the block size... This is probably abusing this
> limit. So I guess the most elegant fix may be to have nvme stop doing
> that ?

Yeah, I'd prefer for io_opt to only be set if the device actually
reports NOWS.

The purpose of io_min is to be the preferred lower I/O size
boundary. One should not submit I/Os smaller than this.

And io_opt is the preferred upper boundary for I/Os. One should not
issue I/Os larger than this value. Setting io_opt to the logical block
size kind of defeats that intent.

That said, we should probably handle the case where the pbs gets scaled
up but io_opt doesn't more gracefully.

-- 
Martin K. Petersen	Oracle Linux Engineering

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

