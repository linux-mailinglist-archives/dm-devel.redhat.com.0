Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CAA51152932
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 11:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580898884;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y1asRWNMStpT6E1RDd2JXps1N3STP9X9FSyBWaR4a+0=;
	b=hjCcAY8DRpiQmtm8vJ66fCQ0R15FknRKu1Qp3IZuW47K8FM70xiRbPEsO/xS62z03i7BwU
	/BqHq9sA2IfasoXiXr90M+N8YIeAiZNmE8pNHVhtS1ssPoCcr2ZlHHUePM2PjOHJ2w/5fz
	BeMxbU+DE/uO4N7sVBoDVkBiTHQYPw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-c921JrMgO_yNttGty8ZU9g-1; Wed, 05 Feb 2020 05:34:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EF56DB22;
	Wed,  5 Feb 2020 10:34:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CA2D60BF4;
	Wed,  5 Feb 2020 10:34:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8ADA2866A0;
	Wed,  5 Feb 2020 10:34:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0143vgu4000773 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 22:57:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4FCE62166B28; Tue,  4 Feb 2020 03:57:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B9E12166B27
	for <dm-devel@redhat.com>; Tue,  4 Feb 2020 03:57:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45841800260
	for <dm-devel@redhat.com>; Tue,  4 Feb 2020 03:57:40 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-339-dnnOAi09Oo2EvkICGElnOA-1; Mon, 03 Feb 2020 22:57:38 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	0143vb72048965; Tue, 4 Feb 2020 03:57:37 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 2xwyg9g2px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2020 03:57:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	0143sDMZ152423; Tue, 4 Feb 2020 03:57:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3030.oracle.com with ESMTP id 2xxvuqn510-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2020 03:57:35 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0143vYHY017366;
	Tue, 4 Feb 2020 03:57:34 GMT
Received: from [192.168.1.14] (/114.88.246.185)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 03 Feb 2020 19:57:34 -0800
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200108071212.27230-1-Nobody@nobody.com>
	<BYAPR04MB5816BA749332D2FC6CE3993AE73E0@BYAPR04MB5816.namprd04.prod.outlook.com>
	<c4ba178c-f5cf-4dd1-784b-e372d6b09f62@oracle.com>
	<BYAPR04MB5816B2967735225FB37D627BE7000@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Bob Liu <bob.liu@oracle.com>
Message-ID: <bc772b99-b629-1979-7ce9-b685242b86d0@oracle.com>
Date: Tue, 4 Feb 2020 11:57:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816B2967735225FB37D627BE7000@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
	malwarescore=0
	phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
	adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1911140001 definitions=main-2002040028
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520
	signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
	definitions=main-2002040028
X-MC-Unique: dnnOAi09Oo2EvkICGElnOA-1
X-MC-Unique: c921JrMgO_yNttGty8ZU9g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 05 Feb 2020 05:34:14 -0500
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH] dm-zoned: extend the way of exposing
 zoned block device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2/3/20 11:06 PM, Damien Le Moal wrote:
> On 2020/02/03 21:47, Bob Liu wrote:
>> On 1/8/20 3:40 PM, Damien Le Moal wrote:
>>> On 2020/01/08 16:13, Nobody wrote:
>>>> From: Bob Liu <bob.liu@oracle.com>
>>>>
>>>> Motivation:
>>>> Now the dm-zoned device mapper target exposes a zoned block device(ZBC) as a
>>>> regular block device by storing metadata and buffering random writes in
>>>> conventional zones.
>>>> This way is not very flexible, there must be enough conventional zones and the
>>>> performance may be constrained.
>>>> By putting metadata(also buffering random writes) in separated device we can get
>>>> more flexibility and potential performance improvement e.g by storing metadata
>>>> in faster device like persistent memory.
>>>>
>>>> This patch try to split the metadata of dm-zoned to an extra block
>>>> device instead of zoned block device itself.
>>>> (Buffering random writes also in the todo list.)
>>>>
>>>> Patch is at the very early stage, just want to receive some feedback about
>>>> this extension.
>>>> Another option is to create an new md-zoned device with separated metadata
>>>> device based on md framework.
>>>
>>> For metadata only, it should not be hard at all to move to another
>>> conventional zone device. It will however be a little more tricky for
>>> conventional zones used for data since dm-zoned assumes that this random
>>> write space is also zoned. Moving this space to a conventional device
>>> requires implementing a zone emulation (fake zones) for the regular
>>> drive, using a zone size that matches the size of sequential zones.
>>>
>>> Beyond this, dm-zoned also needs to be changed to accept partial drives
>>> and the dm core code to accept mixing of regular and zoned disks (that
>>> is forbidden now).
>>>
>>> Another approach worth exploring is stacking dm-zoned as is on top of a
>>> modified dm-linear with the ability to emulate conventional zones on top
>>> of a regular block device (you only need report zones method
>>> implemented). 
>>
>> Looks like the only way to do this emulation is in user space tool(dm-zoned-tools).
>> Write metadata(which contains emulated zone information constructed by dm-zoned-tools)
>> into regular block device.
> 
> User space tool will indeed need some modifications to allow the new
> format. But I would not put this as "doing the emulation" since at that
> level, zones are only an information checked for alignment of metadata
> space and overall capacity of the target. With a regular disk holding the
> metadata, all that needs to be done is assume that this drive is ion fact
> composed solely of conventional zones with the same size as the larger SRM
> disk backend. The total set of zones "assumed" + "real zones from SMR"
> consitute the set of zones that dmzadm will work with for determining the
> overall format, while currently it only uses the set of real zones.
> 
>> It's impossible to add code to every regular block device for emulating conventional zones. 
> 
> There is no need to do that. dm-zoned can emulate fake conventional zones

Oh, what I intend to say is it's impossible adding "BLKREPORTZONE" to regular block device driver.
We have to construct fake zone information for regular device all by dmzadm, based on current information
we can get from regular device.

$ dmzadm --format `regular device` `real zoned device` --force 

> for the regular device (disk or ssd) holding the metadata. Since
> conventional zones do not have any IO restriction nor do they need any zone
> management command (no zone reset), dm-zoned only needs to create a set of
> struct dm_zone for the emulated zones of the regular disk and "manually"
> fill the zone information. This initialization is done in dmz_init_zones().
> Some changes there to create these struct dm_zone and all the remaining
> metadata and write buffering code should not need any change at all (modulo
> the different bdev reference). Do you see the idea ?
> 
> The only place that will need some care is sync processing as 2 devices
> will need to be issued flushes instead of one. The reference to the
> different bdev depending on the zone being accessed will need some care in
> many places too, including reclaim. But dm-kcopy being used there, this
> should be fairly easy.
> 
> Adding a bdevid (an index) field to struct dm_zone, together with an array
> of bdev pointers in struct dmz_dev, should do the trick to simplify
> zone-to-bdev or block-to-bdev conversions (helper functions needed for that).
> 
> Thoughts ?
> 

Thank you for all these suggestions.

Regards,
Bob



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

