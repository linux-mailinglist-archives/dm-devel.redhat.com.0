Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5C97D158B69
	for <lists+dm-devel@lfdr.de>; Tue, 11 Feb 2020 09:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581410589;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5aB/8Vl+BW2BzR6rBsDTPUuXVlUbZOmI20LbqzWt+mg=;
	b=Wyqz7ltuGq1kTBOqxP2QLwznX/+3BZQN+2wsyqgnVCJ079lVRD4DWrLqjEP5eGSe6c0tcR
	+0I5LpPml9UPGyYxh3Dgc+0fFda8DcS6qV1jwC7WScPP8dy2glNOk36NQVnKutDzXKM6ZT
	y4tmO4FQAcr6OYHuheiCzETM+Hvt8gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-nP86ciQdOk6q3O4MhV6Scg-1; Tue, 11 Feb 2020 03:43:06 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD3F618A550B;
	Tue, 11 Feb 2020 08:43:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 677C45C11A;
	Tue, 11 Feb 2020 08:43:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6570E1803C33;
	Tue, 11 Feb 2020 08:42:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01B8gqhJ008715 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Feb 2020 03:42:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4DC422038B80; Tue, 11 Feb 2020 08:42:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47EA02026D67
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:42:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408EE8EB465
	for <dm-devel@redhat.com>; Tue, 11 Feb 2020 08:42:50 +0000 (UTC)
Received: from m4a0072g.houston.softwaregrp.com
	(m4a0072g.houston.softwaregrp.com [15.124.2.130]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-154-QmZWn4A4M46zgyaTGsn8iA-1;
	Tue, 11 Feb 2020 03:42:47 -0500
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP; 
	Tue, 11 Feb 2020 08:41:08 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
	M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Tue, 11 Feb 2020 08:39:24 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.72.12) by
	M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Tue, 11 Feb 2020 08:39:24 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com (10.175.223.16) by
	DM5PR18MB2229.namprd18.prod.outlook.com (52.132.143.152) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2707.21; Tue, 11 Feb 2020 08:39:22 +0000
Received: from DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86]) by
	DM5PR18MB1355.namprd18.prod.outlook.com
	([fe80::946a:bcb6:670b:8e86%12]) with mapi id 15.20.2707.030;
	Tue, 11 Feb 2020 08:39:22 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH v2 10/17] libmultipath: add code to get vendor specific
	vpd data
Thread-Index: AQHV3FZalhOjjtnFIEGy/9H7I8pY06gVtUGA
Date: Tue, 11 Feb 2020 08:39:21 +0000
Message-ID: <66dd0eeb3245d7d350bf98e4511823918d150e5d.camel@suse.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
	<1580929100-32572-11-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-11-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.218.227.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a79be055-13f5-4c11-c0a0-08d7aecde46e
x-ms-traffictypediagnostic: DM5PR18MB2229:
x-microsoft-antispam-prvs: <DM5PR18MB2229536485104558D947EF5CFC180@DM5PR18MB2229.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(199004)(189003)(2906002)(4326008)(66556008)(64756008)(66446008)(66946007)(66476007)(91956017)(76116006)(478600001)(6486002)(316002)(81156014)(8936002)(8676002)(110136005)(81166006)(26005)(71200400001)(6512007)(5660300002)(36756003)(6506007)(2616005)(186003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR18MB2229;
	H:DM5PR18MB1355.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vmusJu9YHRaAveewf6b3NKsj3xKqwroefrJS5ZtHPBsJ3ok21AlciSakvWcIPfup5gWkN/psA7ZuwyUqBrm14hh25se/e/t0FbScilHw/Ucrbw0GLS0AovqK5w0C7Oisq8JTbwJr6mkFtzhdBxM9etw1yZ2zmW2LSJABSA3+xVxMQhnouvg3N6m6Fj5B7SEweHcmzhzTtqUXbMbk+xLsab0T/sKpzXoz7HCP9tgBLi5EqryWIwIj1Q7qN7LBPNAwRevtXtntRdTfSs8XJW8axEGGSwF4r8K7DCFgAN8xk+YfSxhhVyKOFtD5OYbO18pVtAjFJxkMxMqXczyHjcogMXFmwSWiPMlKrET7Gtpjt+f55VJ6h4stas3jKh8fDArwBO7pgJ45HCz5k8i6l75ocAd7o7cFmCvckQb/rEYDLTN/3pkiACHSv88vC0Dq7Uhw
x-ms-exchange-antispam-messagedata: xn3NEp9jlZH9UFjFUNww1A4hnOjWIso8KH+7pc9gqUBdbBQKG2pOA8psjbCiUXGAfqSc/JfALuVsb62ddVBcsRs5uQt3PKAox3nI+f7/B+zoelfsuvs89d9XJfKp73m3b5JOv/bXmT1M/W3MKAAhtw==
x-ms-exchange-transport-forked: True
Content-ID: <8CF1518E5100A2439158042A20323D37@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a79be055-13f5-4c11-c0a0-08d7aecde46e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 08:39:21.8727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mquYzzrycijKIAo3wqV7y1swLIuKsrnjEKinj7y7tfHqAbMay5A8j4F3y/BSttTZp+nW82rOJokSvh2khxbrjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR18MB2229
X-OriginatorOrg: suse.com
X-MC-Unique: QmZWn4A4M46zgyaTGsn8iA-1
X-MC-Unique: nP86ciQdOk6q3O4MhV6Scg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01B8gqhJ008715
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 10/17] libmultipath: add code to get
 vendor specific vpd data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-05 at 12:58 -0600, Benjamin Marzinski wrote:
> This adds the wildcard 'g' for multipath and path formatted printing,
> which returns extra data from a device's vendor specific vpd
> page.  The
> specific vendor vpd page to use, and the vendor/product id to decode
> it
> can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id. It
> can
> be configured in the devices section of multipath.conf with the
> vpd_vendor parameter. Currently, the only devices that use this are
> HPE
> 3PAR arrays, to return the Volume Name.
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/config.c      |  2 ++
>  libmultipath/config.h      |  1 +
>  libmultipath/dict.c        | 38 ++++++++++++++++++++++++++++++++++++
>  libmultipath/discovery.c   | 40
> +++++++++++++++++++++++++++++++++++++-
>  libmultipath/hwtable.c     |  1 +
>  libmultipath/print.c       | 25 ++++++++++++++++++++++++
>  libmultipath/propsel.c     | 18 +++++++++++++++++
>  libmultipath/propsel.h     |  1 +
>  libmultipath/structs.h     | 15 ++++++++++++++
>  multipath/multipath.conf.5 |  8 ++++++++
>  10 files changed, 148 insertions(+), 1 deletion(-)

Acked-by: Martin Wilck <mwilck@suse.com>

(wishing that the memory usage can be decreased in a follow-up patch).


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

