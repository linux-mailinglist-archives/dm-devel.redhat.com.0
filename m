Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F11791CB841
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 21:26:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588965995;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=USOKhn4I6GYjw70rSIZNkEvmpBWOrgwcq8nc0W0yDSE=;
	b=csLLpd8Vn3Ij56naFs/FblLWpVml/0jWzifHnTYdPck97kvHodu1g4PF+yBqZpyoQVvQdQ
	cqS4waez6ivBBPUrAZacFtk2Ir52tNlv/RK+MyEdMPvZWsPT/nOYuerIs0h9U3JcA1QfHK
	4wyRxvqJjT1jhcJsD1bh9wcKqn8bErk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-2IuL1apjPle3gVEXnq77kA-1; Fri, 08 May 2020 15:26:30 -0400
X-MC-Unique: 2IuL1apjPle3gVEXnq77kA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EB0E835B42;
	Fri,  8 May 2020 19:26:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73B1F6AD0A;
	Fri,  8 May 2020 19:26:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47C111809543;
	Fri,  8 May 2020 19:26:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048JPvfO011276 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 15:25:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9F0413CC85; Fri,  8 May 2020 19:25:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A51FF1635A4
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:25:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B6748007DB
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:25:54 +0000 (UTC)
Received: from m9a0013g.houston.softwaregrp.com
	(m9a0013g.houston.softwaregrp.com [15.124.64.91]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-306-VNI4F02GP_u6dS91r-H5TQ-1;
	Fri, 08 May 2020 15:25:50 -0400
X-MC-Unique: VNI4F02GP_u6dS91r-H5TQ-1
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
	m9a0013g.houston.softwaregrp.com WITH ESMTP; 
	Fri,  8 May 2020 19:24:48 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Fri, 8 May 2020 19:25:43 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Fri, 8 May 2020 19:25:43 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com (2603:10b6:4:62::23)
	by DM5PR1801MB2009.namprd18.prod.outlook.com (2603:10b6:4:63::34)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33;
	Fri, 8 May 2020 19:25:42 +0000
Received: from DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710]) by
	DM5PR1801MB1883.namprd18.prod.outlook.com
	([fe80::cd6:b672:d8d3:2710%7]) with mapi id 15.20.2958.035;
	Fri, 8 May 2020 19:25:42 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>
Thread-Topic: [PATCH] libmultipath: simplify failed wwid code
Thread-Index: AQHWJW526mvpvHxG2UOJRacYP6fcdg==
Date: Fri, 8 May 2020 19:25:42 +0000
Message-ID: <8de715fa759f8f28bb0e5321201d7f34cdd3ae4e.camel@suse.com>
References: <1588372766-21317-1-git-send-email-bmarzins@redhat.com>
	<55e6cd5b0826a0393bbd2cd15e3cf9f31f8f0986.camel@suse.com>
	<20200508163200.GQ5907@octiron.msp.redhat.com>
In-Reply-To: <20200508163200.GQ5907@octiron.msp.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2
x-originating-ip: [92.211.129.134]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96ec0451-eaa1-4644-e627-08d7f3859947
x-ms-traffictypediagnostic: DM5PR1801MB2009:
x-microsoft-antispam-prvs: <DM5PR1801MB2009E16665A1F2D3EBCF6881FCA20@DM5PR1801MB2009.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 039735BC4E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b/OM2meE7ClEbH/UTwLbdYTNicwp/Gh14ABMt2hNETjlweEdGQ9Cl3qZRlxup6fFUzExxYHQD5yKezzAAX9IYMvU9k3sOdm4SIUv1CB6J0rg8TtDs852kx9JOpJqv8O15NJN4OwDWV5WymNvr9/TRhuZfReOSfi0MA2cwEd/g8s+5t7dhfjpdrnSBUd2C6CvshpebWl+eMIhDKLaC8M84PlAblCP0WcFCeRedXd31GwEBWcEcWP+Y3hcjllKblPGRnELE2dRJ0KqWs741BVfS97ZP8tPR5sNj5+6UrfvrURDfW5vjzeue+fIrnKte47wCHxvN/jqcFIzw99d0pV4Rvq0oaqY4UEh8k6UV+zW2YF7BzUbOPFxJ6ogcvnH0LnW+xlvVTusS0HACRphg1hIV/V/cosd9BGzg/A9f///MulQWPaoX55ysvG9xOlNLOAAtAEfUS82DZhOjIHRnKLRxZniBCkzB8eRbsfTyWJfXQAmKtseLENb1pa5TimUvVKzCcW3TfRouWT7kBRpQXgm2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DM5PR1801MB1883.namprd18.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(33430700001)(5660300002)(64756008)(83320400001)(4744005)(36756003)(66446008)(91956017)(66556008)(66476007)(83310400001)(33440700001)(83300400001)(66946007)(76116006)(71200400001)(6916009)(2616005)(478600001)(6486002)(4326008)(6512007)(186003)(26005)(86362001)(54906003)(2906002)(8676002)(316002)(6506007)(8936002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: uY1hEPufnK2fTvLnigCd26/0Dt6H+kD4vhMxNLMMPZTPeT7HARuz4qTUunRZ3wY16IeQeR3YtsEf8jmzwDLJhxW/CjdKvApUeKqqyrfgcLH5AjjagvFqBCcG30NNmeoN6528UDcmmzs9JN38IQhBXqY9CQykfTXSRFO4Si0SNU5VkO7nvd4b1Bzxma94jzka+gGpS60KcRSh1ZkI5fw904nqzZj1o60ww3G7NLDQ9aFgxx3xjwqX0QQ5O0IEDLDM8kqNVeRYYSsomzZmI+q/gPUjbhPcj/qfDhVNsw0Ktg4T6+jMP36RC/F2r/vS0DZ2zPoJ4hA7T978lf1CSaqUYqbhGk/kpo1nGBSXAkvhoMXCoaFnzjjMDNqnJatWjb3cPzB8L/s5jCY9mQIB37fQ79F0QckqjYk6byCAfTToVDQbUnegWuGKod6A/EMSGwo0djz4wFJjKSVChyuLYXsJWfKNVY51iLo+KSxvLewrxKNgglpYKMuEc00xzmTiXWEo
x-ms-exchange-transport-forked: True
Content-ID: <CABC766099B7B44BA16F5007AA283D4E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ec0451-eaa1-4644-e627-08d7f3859947
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2020 19:25:42.3830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53cd6UIQISrZG9u0yacR9dSBsz9er9yAT5UiucSGY8SONCASMdCeD/eYr2E2W+Zj88sswjBkiivoGidlyhUDlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1801MB2009
X-OriginatorOrg: suse.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048JPvfO011276
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: simplify failed wwid code
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

On Fri, 2020-05-08 at 11:32 -0500, Benjamin Marzinski wrote:
> On Fri, May 08, 2020 at 09:15:32AM +0000, Martin Wilck wrote:
> > 
> > Please consider adding the attached patch on top, which switches
> > back
> > to atomic creation of the failed_wwids file, with just a little bit
> > more compexity. I prefer the creation of the file to be atomic on
> > the
> > file system level. IMO that's how "flag" files like this should be
> > handled in principle, and doing it correctly makes me feel better,
> > even
> > though I have to concur that an actual race is hardly possible.
> 
> Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Or where you looking for me to respin with this included? Either way
> is
> fine.

Please respin, to have a clean patch set on the ML.

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

